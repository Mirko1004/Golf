import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getSkinsUnit() {

  return Column(
    children: <Widget>[

      SizedBox(height: 40.0),

      Row(
        children: <Widget>[

          Text('skins unit ', style: AppStyles.getSFUITextLight()),

          Text('(wager by each player)',
              style: AppStyles.getSFUITextLight2()),
        ],
      ),
      SizedBox(height: 10.0),

      Container(
        height: 55.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                InkWell(
                  onTap: null,

                  child: Container(
                      width: 116.0,
                      height: 40,
                      decoration: new BoxDecoration(
                        border: Border.all(
                          color: AppColors.greyColor7,
                        ),
                        color: Colors.white,
                      ),

                      child: Center(

                        child: Text(
                          '\$1',
                          style: AppStyles.getSFUITextMediumStyle(
                              20.0, 0.0, Colors.black, FontWeight.w500),
                        ),
                      )

                      ),
                ),

                SizedBox(width: 11.0),

                InkWell(
                    onTap: null,
                    child: Container(
                        height:
                        40.0,
                        width: 69.0,
                        color: AppColors.greyColor9,
                        child: Center(
                            child: Text(
                              '\$5',
                              style: AppStyles.getSFUITextMediumStyle(
                                  20.0, 0.0, Colors.black, FontWeight.w500),
                            )))),

                SizedBox(width: 11.0),

                InkWell(
                    onTap: null,
                    child: Container(
                        height: 40.0,
                        width: 69.0,
                        color: AppColors.greyColor9,
                        child: Center(
                            child: Text(
                              '\$10',
                              style: AppStyles.getSFUITextMediumStyle(
                                  20.0, 0.0, Colors.black, FontWeight.w500),
                            )))),

                SizedBox(width: 11.0),

                InkWell(
                    onTap: null,
                    child: Container(
                        height: 40.0,
                        width: 69.0,
                        color: AppColors.greyColor9,
                        child: Center(
                            child: Text(
                              '\$15',
                              style: AppStyles.getSFUITextMediumStyle(
                                  20.0, 0.0, Colors.black, FontWeight.w500),
                            )))),

                SizedBox(width: 11.0),

                InkWell(
                    onTap: null,
                    child: Container(
                        height: 40.0,
                        width: 69.0,
                        color: AppColors.greyColor9,
                        child: Center(
                            child: Text(
                              '\$20',
                              style: AppStyles.getSFUITextMediumStyle(
                                  20.0, 0.0, Colors.black, FontWeight.w500),
                            )))),

                SizedBox(width: 10.0),

              ],
            ),
          ],
        ),
      ),
    ],
  );
}
