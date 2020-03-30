import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getColumnFAM() {

  return Padding(
    padding: EdgeInsets.only(top: 30.0),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text('what skills would you play with?',
            style: AppStyles.getSFUITextLight()),

        SizedBox(height: 4.0),

        Text('(select one or more)',
            style: AppStyles.getSFUITextLight2()),

        SizedBox(height: 15.0),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            InkWell(
              onTap: null,

              child: Container(
                  width: 161.0,
                  height: 40,
                  decoration: new BoxDecoration(
                    color: AppColors.greenColor,
                  ),

                  child: Center(
                    child: Text('any', style: AppStyles.getSFUITextSemiBold()),
                  )),
            ),

            InkWell(
              onTap: null,

              child: Container(
                  width: 161.0,
                  height: 40,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: AppColors.greyColor29, width: 1.0),
                  ),

                  child: Center(

                    child: Text('beginner',
                        style: AppStyles.getSFUITextSemiBold2()),

                  )),
            ),
          ],
        ),

        Padding(padding: EdgeInsets.only(top: 10.0)),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            InkWell(
              onTap: null,

              child: Container(
                  width: 161.0,
                  height: 40,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: AppColors.greyColor29, width: 1.0),
                  ),

                  child: Center(
                    child: Text('above 100',
                        style: AppStyles.getSFUITextSemiBold2()),
                  )),
            ),

            InkWell(
              onTap: null,

              child: Container(
                  width: 161.0,
                  height: 40,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: AppColors.greyColor29, width: 1.0),
                  ),

                  child: Center(
                    child: Text('shoot in the 90s',
                        style: AppStyles.getSFUITextSemiBold2()),
                  )),
            ),

          ],
        ),

        Padding(padding: EdgeInsets.only(top: 10.0)),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            InkWell(
              onTap: null,

              child: Container(
                  width: 161.0,
                  height: 40,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: AppColors.greyColor29, width: 1.0),
                  ),

                  child: Center(
                    child: Text('shoot in the 80s',
                        style: AppStyles.getSFUITextSemiBold2()),
                  )),
            ),

            InkWell(
              onTap: null,

              child: Container(
                  width: 161.0,
                  height: 40,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: AppColors.greyColor29, width: 1.0),
                  ),

                  child: Center(
                    child: Text('shoot in the 70s',
                        style: AppStyles.getSFUITextSemiBold2()),
                  )),
            ),

          ],
        ),

        Padding(padding: EdgeInsets.only(top: 10.0)),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            InkWell(
              onTap: null,

              child: Container(
                  width: 161.0,
                  height: 40,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: AppColors.greyColor29, width: 1.0),
                  ),

                  child: Center(

                    child: Text('break 70',
                        style: AppStyles.getSFUITextSemiBold2()),
                  )),
            ),

          ],
        ),
      ],
    ),
  );
}
