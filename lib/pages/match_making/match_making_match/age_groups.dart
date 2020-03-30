import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getAgeGroups() {

  return Padding(
    padding: EdgeInsets.only(top: 40.0),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text('select preferred age groups',
            style: AppStyles.getSFUITextLight()),

        SizedBox(height: 5.0),

        Text(
          '(Select one or more)',
          style: AppStyles.getSFUITextLight2(),
        ),

        SizedBox(height: 15.0),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            InkWell(
              onTap: null,

              child: Container(
                  width: 104.0,
                  height: 40.0,
                  decoration: new BoxDecoration(
                    color: AppColors.greenColor,
                  ),

                  child: Center(

                    child: Text('any',
                        style: AppStyles.getSFUITextSemiBold()),
                  )),
            ),

            InkWell(
              onTap: null,

              child: Container(
                  width: 104.0,
                  height: 40,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: AppColors.greyColor29, width: 1.0),
                  ),

                  child: Center(

                    child: Text('18-24',
                        style: AppStyles.getSFUITextSemiBold2()),
                  )),
            ),

            InkWell(
              onTap: null,

              child: Container(
                  width: 104.0,
                  height: 40,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: AppColors.greyColor29, width: 1.0),
                  ),

                  child: Center(

                    child: Text('25-34',
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
                  width: 104.0,
                  height: 40,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: AppColors.greyColor29, width: 1.0),
                  ),

                  child: Center(

                    child: Text('35-44',
                        style: AppStyles.getSFUITextSemiBold2()),
                  )),
            ),

            InkWell(
              onTap: null,

              child: Container(
                  width: 104.0,
                  height: 40,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: AppColors.greyColor29, width: 1.0),
                  ),

                  child: Center(

                    child: Text('45-54',
                        style: AppStyles.getSFUITextSemiBold2()),
                  )),
            ),

            InkWell(
              onTap: null,

              child: Container(
                  width: 104.0,
                  height: 40,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                        color: AppColors.greyColor29, width: 1.0),
                  ),

                  child: Center(

                    child: Text('55+',
                        style: AppStyles.getSFUITextSemiBold2()),
                  )),
            ),

          ],
        ),
      ],
    ),
  );
}
