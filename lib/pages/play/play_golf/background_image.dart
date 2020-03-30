import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getBackgroundImage(BuildContext context) {

  return  Stack(
    children: <Widget>[

      Container(
        height: 380.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/hunters_green.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),

      AppBar(
        titleSpacing: 0.0,
        backgroundColor: Colors.transparent,

        title: Text(
          'PLAY GOLF',
          style: AppStyles.getSurannaStyle(24.0, 0.0, Colors.white),
        ),

        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset('assets/images/back_network.png')),
      ),

      Positioned.fill(
        top: 50.0,

        child: Align(
          alignment: Alignment.center,

          child: Text("HUNTER'S GREEN ",
              style: AppStyles.getSurannaStyle(
                  30.0, 1.07, AppColors.orangeColor)),
        ),
      ),

      Positioned.fill(
          top: 115.0,
          child: Align(
            alignment: Alignment.center,
            child: Text('COUNTRY CLUB ',
                style: AppStyles.getSurannaStyle(
                    30.0, 1.07, AppColors.orangeColor)),
          )),

      Positioned.fill(
          top: 170.0,
          child: Align(
            alignment: Alignment.center,
            child: Text('Tampa, FL',
                style: AppStyles.getSFUITextRegularStyle(
                    14.0, 0.0, Colors.white, FontWeight.w400)),
          )),

      Positioned.fill(
          top: 280.0,

          child: Align(
            alignment: Alignment.center,
            child: Text('18 HOLES',
                style: AppStyles.getSFUITextRegularStyle(12.0, 0.33,
                    AppColors.greyColor9, FontWeight.w400)),
          )),

      Positioned.fill(
          top: 320.0,
          child: Align(
            alignment: Alignment.center,
            child: Text('COURSE RATING: 77.7',
                style: AppStyles.getSFUITextRegularStyle(12.0, 0.33,
                    AppColors.greyColor9, FontWeight.w400)),
          )),

    ],
  );
}