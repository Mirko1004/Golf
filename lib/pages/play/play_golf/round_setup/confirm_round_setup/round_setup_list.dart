import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getRoundSetupList() {

  Widget row(String image, String text, String text2) {

    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0.0),

      child: Column(
        children: <Widget>[

          Row(
            children: <Widget>[

              Image.asset(image),

              Column(
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.only(left: 25.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text(text, style: AppStyles.getSFUITextLight2()),

                        SizedBox(height: 10.0),

                        Text(text2, style: AppStyles.getSFUITextMediumStyle3()),

                      ],
                    ),
                  )

                ],
              ),
            ],
          ),

          SizedBox(height: 20.0),

        ],
      ),
    );
  }

  return Column(
    children: <Widget>[

      SizedBox(height: 10.0),

      Row(children: <Widget>[ row('', 'round type', '18 hole')]),

      Padding(padding: EdgeInsets.only(left: 18.0, right: 18.0),
          child: Container(height: 1.0, color: AppColors.greyColor9)),

      SizedBox(height: 25.0),

      Row(children: <Widget>[ row('', 'starting hole', 'hole 1')]),

      Padding(padding: EdgeInsets.only(left: 18.0, right: 18.0),
          child: Container(height: 1.0, color: AppColors.greyColor9)),

      SizedBox(height: 25.0),

      Row(children: <Widget>[ row('', 'distance', 'yards')]),

      Padding(padding: EdgeInsets.only(left: 18.0, right: 18.0),
          child: Container(height: 1.0, color: AppColors.greyColor9)),

      SizedBox(height: 25.0),

      Row(children: <Widget>[ row('', 'skin unit', "5\$")]),

      Padding(padding: EdgeInsets.only(left: 18.0, right: 18.0),
          child: Container(height: 1.0, color: AppColors.greyColor9)),

      SizedBox(height: 25.0),

      Row(children: <Widget>[ row('', 'players', '8')]),

      SizedBox(height: 25.0),


    ],
  );
}