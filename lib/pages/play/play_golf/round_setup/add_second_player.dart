import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getAddSecondPlayer( BuildContext context) {

  return Container(
    padding: EdgeInsets.only(top:50.0),

      child: Padding(
        padding:  EdgeInsets.only(right:10.0),

        child: Column(

          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Text('players',
                style: AppStyles.getSFUITextLightStyle2(18.0, Colors.black, FontWeight.w300)),

                InkWell(
                  onTap: null,
                  child: Text('add player',
                  style: AppStyles.getSFUITextMediumStyle(14.0, 0.0, AppColors.greenColor, FontWeight.w500),),
                )

              ],

            ),

            Row(
              children: <Widget>[

                Image.asset(''),

                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text('Add Second Player',
                          style: AppStyles.getSFUITextMediumStyle(
                              18.0, 0.0, AppColors.lightBlack, FontWeight.w500)),

                      SizedBox(height: 10.0),

                      Row(
                        children: <Widget>[

                          Text('handicap', style: AppStyles.getRobotoLightStyle(0.8)),

                          Text(' 0', style: AppStyles.getRobotoMediumStyle()),

                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
}
