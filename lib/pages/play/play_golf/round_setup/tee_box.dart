import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getTeeBox() {
  Widget row(String image, String textColor, String textS, String textR) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            InkWell(
              onTap: null,
              child: Container(

                width: 140.0,
                height: 112,
                decoration: new BoxDecoration(
                  color: AppColors.greyColor9,
                ),

                child: Padding(
                  padding: EdgeInsets.only(top:10.0,left: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Image.asset(image),

                      SizedBox(height: 10.0),

                      Text(textColor,
                          style: AppStyles.getSFUITextMediumStyle(18.0, 0.0,
                              AppColors.blackColor4, FontWeight.w500)),

                      SizedBox(height: 10.0),

                      Row(
                        children: <Widget>[

                          Text( 'S ',
                            style: AppStyles.getSFUITextLight6(),
                          ),

                          Text( textS,
                            style: AppStyles.getSFUITextMediumStyle2(),
                          ),

                          Text('  R ',
                            style: AppStyles.getSFUITextLight6(),
                          ),

                          Text( textR,
                            style: AppStyles.getSFUITextMediumStyle2(),

                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )

    ;
  }


  return Padding(
    padding: EdgeInsets.only(top:10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text('select tee box', style: AppStyles.getSFUITextLight()),

        Container(
            padding: EdgeInsets.only(top: 10.0),
            height: 122.0,
            color: Colors.white,

            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                row('', 'black', '120', '72.2'),

                SizedBox(width: 10.0),

                row('', 'blue', '110', '69.3'),

                SizedBox(width: 10.0),

                row('', 'white', '95.5', '72.2'),

                SizedBox(width: 10.0),

              ],

            )
        ),
      ],
    ),
  );
}





