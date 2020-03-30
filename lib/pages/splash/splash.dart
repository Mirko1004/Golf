import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:golf/base/base_bloc_widget.dart';
import 'package:golf/pages/splash/splash_bloc.dart';
import 'package:golf/utils/app_colors.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final SplashBloc _splashBloc = SplashBloc();
  int page = 0;
  PageController _pageController = PageController(initialPage: 0);
  StreamSubscription _isSignedSubscription;

  @override
  void initState() {
    _isSignedSubscription = _splashBloc.goToSubject.listen((goTo) {
      if (goTo > 0) {
          if (goTo == 1)
            Navigator.pushReplacementNamed(context, "/profileSetup");
          else if (goTo == 2)
            Navigator.pushReplacementNamed(context, "/home");
          else
            Navigator.pushReplacementNamed(context, "/login");
      }
    });

    _pageController.addListener(() {
      setState(() {
        page = _pageController.page.toInt();
      });
    });

    _splashBloc.refreshToken();

    super.initState();
  }

  @override
  void dispose() {
    _isSignedSubscription?.cancel();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
    ));

    return BaseBlocWidget(
      _splashBloc,
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/splash_01.png'), fit: BoxFit.fitWidth),
        ),

        child: Column(
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            _navigation(context, page),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
//              DotsIndicator(
//                dotsCount: 3,
//                position: page,
//                decorator: DotsDecorator(
//                  activeColor: page == 1 ? Colors.black : Colors.white,
//                ),
//              ),
          ],
        ),
      ),

    );
  }
//  @override
//  Widget build(BuildContext context) {
//    return BaseBlocWidget(
//      _splashBloc,
//      Stack(
//        children: <Widget>[
//          PageView(
//            controller: _pageController,
//            children: <Widget>[
//              _page(context, 0),
////              _page(context, 1),
////              _page(context, 2),
//            ],
//          ),
//          Column(
//            verticalDirection: VerticalDirection.up,
//            children: <Widget>[
//              _navigation(context, page),
//              Padding(
//                padding: EdgeInsets.only(top: 20.0),
//              ),
////              DotsIndicator(
////                dotsCount: 3,
////                position: page,
////                decorator: DotsDecorator(
////                  activeColor: page == 1 ? Colors.black : Colors.white,
////                ),
////              ),
//            ],
//          ),
//        ],
//      ),
//    );
//  }
}

//Widget _page(BuildContext context, int page) {
//  String image;
//  switch (page) {
//    case 0:
//      {
//        image = 'assets/images/splash_01.png';
//      }
//      break;
//    case 1:
//      {
//        image = 'assets/images/splash2.png';
//      }
//      break;
//    case 2:
//      {
//        image = 'assets/images/splash3.png';
//      }
//      break;
//  }
//
//  return Container(
//    decoration: BoxDecoration(
//      image: DecorationImage(image: AssetImage(image), fit: BoxFit.fitWidth),
//    ),
//  );
//}

_navigation(BuildContext context, int page) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[

      Container(
        height: 147.0,
        width: 200.0,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/brand_logo.png'), fit: BoxFit.fill),
        ),
      ),

      Padding(padding: EdgeInsets.only(top: 80.0),),

      Container(
        padding: EdgeInsets.symmetric(horizontal: 60.0),
        child: Text(
          "Country Club Lifestyle at Your Fingertips.",
          textAlign: TextAlign.center,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 24.0,
              color: Colors.white,
              fontFamily: 'SFUIText-Regular',
              fontWeight: FontWeight.w300),
        ),
      ),


      Padding(padding: EdgeInsets.only(top: 80.0),),

      FlatButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed("/signup"),
        child: Center(
          child: Container(
            decoration: new BoxDecoration(
              color: Color(0x32F1D8BD),
              border: Border.all( color: AppColors.orangeColor, width: 1.0),
              borderRadius: BorderRadius.horizontal(),
            ),
            width: MediaQuery.of(context).size.width*.8,
            height: 40.0,
            child: Center(
              child: Text(
                "SIGN UP",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'Suranna-Regular',
                    fontWeight: FontWeight.w100),
              ),

            ),

          ),
        ),
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Text(
            "already onboard?",
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 14.0,
                color: Colors.white,
                fontFamily: 'SFUIText-Regular',
                fontWeight: FontWeight.w300),
          ),

          FlatButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed("/login"),
            child: Text(
              "LOGIN",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20.0,
                  color: Color(0xffF1D8BD),
                  fontFamily: 'Suranna-Regular',
                  fontWeight: FontWeight.w100),
            ),
          ),

        ],

      ),

      Padding(padding: EdgeInsets.only(top: 20.0),),

    ],
  );
}
