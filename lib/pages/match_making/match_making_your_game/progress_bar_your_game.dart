import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getProgressBarYourGame() {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[

      Text('step', style: AppStyles.getSFUITextLight()),

      Row(
        children: <Widget>[

          Expanded(

            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[

                Positioned(
                  child: Padding(
                    padding: EdgeInsets.all(30.0),

                    child: Container(
                      color: AppColors.orangeColor,
                      height: 1.0,
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.topRight,

                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[

                      ClipOval(

                        child: Container(
                          height: 32.0, // height of the button
                          width: 32.0,
                          alignment: AlignmentDirectional.center,
                          decoration: new BoxDecoration(
                              color: AppColors.lightWhite2,
                              borderRadius: new BorderRadius.circular(25.0),
                              border: new Border.all(
                                width: 1.0,
                                color: AppColors.orangeColor,
                              )),
                        ),
                      ),

                      Text('3', style: AppStyles.getSurannaStyle(23.0, 0.0, Colors.black)),

                    ],
                  ),
                ),

                Positioned(
                  left: 1.0,

                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[

                      ClipOval(

                        child: Container(
                          height: 32.0, // height of the button
                          width: 32.0,
                          alignment: AlignmentDirectional.center,
                          decoration: new BoxDecoration(
                              color: AppColors.greyColor7,
                              borderRadius: new BorderRadius.circular(25.0),
                              border: new Border.all(
                                width: 1.0,
                                color: AppColors.orangeColor,
                              )),
                        ),
                      ),
                    ],
                  ),

                ),

                Positioned(
                  left: 8.0,

                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[

                      ClipOval(

                        child: Container(
                          height: 32.0, // height of the button
                          width: 32.0,
                          alignment: AlignmentDirectional.center,
                          decoration: new BoxDecoration(
                              color: AppColors.greenColor,
                              borderRadius: new BorderRadius.circular(25.0),
                              border: new Border.all(
                                width: 1.0,
                                color: AppColors.orangeColor,
                              )),
                        ),
                      ),

                      Text('2',
                          style: AppStyles.getSurannaStyle(
                              23.0, 0.0, AppColors.lightWhite2)),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
