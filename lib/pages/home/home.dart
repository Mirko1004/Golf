import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/community/community.dart';
import 'package:golf/pages/home/drawer/drawer.dart';
import 'package:golf/pages/home/home_bars/home_app_bar.dart';
import 'package:golf/pages/home/home_bloc.dart';
import 'package:golf/pages/home_page/home_page.dart';
import 'package:golf/pages/play/play.dart';
import 'package:golf/pages/pro_shop/pro_shop.dart';
import 'package:golf/pages/profile/profile.dart';

import '../../app_constants.dart';
import 'home_bars/home_bottom_bar.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc _homeBloc = HomeBloc();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  PageController _pageController;
  StreamSubscription _currentPageSubscription;
  StreamSubscription _isSignedSubscription;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {

    _isSignedSubscription = _homeBloc.session.isSignedIn.listen((isLoggedIn) {
      if (!isLoggedIn) {
        _homeBloc.dataCache.currentPage.value = 0;
        Navigator.pushReplacementNamed(context, "/login");
      }
    });

    _pageController = PageController(initialPage: _homeBloc.dataCache.currentPage.value);

    _currentPageSubscription = _homeBloc.dataCache.currentPage.listen((page) {
      if (_pageController.hasClients) {
        _pageController.jumpToPage(page);
      }
    });

    _homeBloc.initDataCache();

    //Fcm push stuff.
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        _homeBloc.dataCache.getNewNotificationCount();
        _homeBloc.dataCache.getNotifications(false);
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        _homeBloc.dataCache.getNewNotificationCount();
        _homeBloc.dataCache.getNotifications(false);
        print("onResume: $message");
      },
      onBackgroundMessage: myBackgroundMessageHandler,
    );

    _firebaseMessaging.requestNotificationPermissions( const IosNotificationSettings(sound: true, badge: true, alert: true));

    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });

    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print( "FCMtoken: $token"  );
      _homeBloc.dataCache.registerFcmToken(token);
    });

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _isSignedSubscription?.cancel();
    _currentPageSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
    ));

    return BaseBlocScaffoldWidget(
      _homeBloc,
      getHomeAppBar(context, _scaffoldKey,_homeBloc),
      Container(
        child: Column(
          children: <Widget>[

            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (page) => _homeBloc.dataCache.currentPage.value = page,
                children: [
                  HomePage(),
                  Community(),
                  Play(),
                  ProShop(),
                  Profile(),
                ],
              ),
            ),

            HomeBottomBar(_homeBloc),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      drawer: getDrawer(context,  _homeBloc),
      scaffoldKey: _scaffoldKey,
    );
  }
}
