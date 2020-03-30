import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:golf/pages/home/home_bloc.dart';
import 'package:golf/pages/notifications/notifications.dart';
import 'package:golf/pages/search/search.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getHomeAppBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey, HomeBloc homeBloc) {
  return PreferredSize(
    preferredSize: Size.fromHeight(58.0),
    child: SafeArea(
      child: Stack(
        children: <Widget>[

          Center(
            child: Text('18TH&MAIN',
                textAlign: TextAlign.center,
                style: AppStyles.getSurannaStyle(
                    26.0, 1.0, AppColors.blackColor)
            ),

          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Padding( padding: EdgeInsets.only(left: 15.0),),

                  InkWell(
                    onTap: () => scaffoldKey.currentState.openDrawer(),
                    child: Image.asset('assets/images/menu.png'),
                  ),

                  Spacer(),

                  StreamBuilder<int>(
                      stream: homeBloc.dataCache.notificationsNewCount,
                      initialData: 0,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {

                        if(snapshot.data == 0)
                          return getNotificationWidget(context);

                        return InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Notifications())),
                          child: Badge(
                            badgeContent: Text(snapshot.data.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            badgeColor: AppColors.greenColor,
                            child: getNotificationWidget(context),
                          ),
                        );

                      }

                  ),

                  Padding( padding: EdgeInsets.only(left: 15.0),),

                  InkWell(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => getSearch(context, homeBloc))),
                      child: Image.asset('assets/images/search_icon.png')
                  ),

                  Padding( padding: EdgeInsets.only(left: 15.0),),

                ],
              ),

            ],
          ),


        ],
      ),
    ),
  );
}

getNotificationWidget(BuildContext context) {
  return InkWell(
    onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Notifications())),
    child: Image.asset('assets/images/Notifications.png'),
  );
}