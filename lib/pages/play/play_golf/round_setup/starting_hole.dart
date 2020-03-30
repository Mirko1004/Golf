import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getStartingHole() {

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[

      SizedBox(height: 20.0),

      Text('starting hole', style: AppStyles.getSFUITextLight()),

      Container(
        padding: EdgeInsets.only(top: 10.0),
        height: 110.0,
        color: Colors.white,

        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                InkWell(
                  onTap: null,

                  child: Container(
                      width: 140.0,
                      height: 92,
                      decoration: new BoxDecoration(
                        color: AppColors.greenColor,
                      ),

                      child: Padding(
                        padding: EdgeInsets.only(top:28.0,left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            Image.asset(''),

                            SizedBox(height: 10.0),

                            Text('hole 1',
                                style: AppStyles.getSFUITextMediumStyle(18.0, 0.0,
                                    AppColors.orangeColor, FontWeight.w500)),

                          ],
                        ),
                      )),
                ),

                SizedBox(width: 10.0),

                InkWell(
                  onTap: null,

                  child: Container(
                    width: 140.0,
                    height: 92.0,
                    decoration: new BoxDecoration(
                      color: AppColors.greyColor9,
                    ),

                    child: Padding(
                      padding: EdgeInsets.only(top:28.0,left: 20.0),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Image.asset(''),

                          SizedBox(height: 10.0),

                          Text('hole 10',
                              style: AppStyles.getSFUITextMediumStyle(18.0, 0.0, AppColors.blackColor4, FontWeight.w400)),

                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 10.0),

                InkWell(
                  onTap: null,

                  child: Container(
                    width: 140.0,
                    height: 92.0,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      border:
                      new Border.all(color: AppColors.greyColor7, width: 1.0),
                      borderRadius: new BorderRadius.horizontal(),
                    ),

                    child: Padding(
                      padding: EdgeInsets.only(top:28.0,left: 20.0),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Image.asset(''),

                          SizedBox(height: 10.0),

                          Text('select hole',
                              style: AppStyles.getSFUITextRegularStyle(
                                  18.0, 0.0, AppColors.greyColor7, FontWeight.w400)),

                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 10.0),

              ],
            ),
          ],
        ),
      ),
    ],
  );
}
