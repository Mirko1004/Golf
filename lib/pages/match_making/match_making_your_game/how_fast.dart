import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getHowFast() {
  return Padding(
    padding: EdgeInsets.only(top: 35.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text('how fast do you play golf?', style: AppStyles.getSFUITextLight()),

        Container(
          height: 70.0,

          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  InkWell(
                    onTap: null,

                    child: Container(
                        width: 72.0,
                        height: 40,
                        decoration: new BoxDecoration(
                          color: AppColors.greenColor,
                        ),

                        child: Center(

                          child: Text('any',
                              style: AppStyles.getSFUITextSemiBold()),
                        )),
                  ),

                  SizedBox(width: 10.0),

                  InkWell(
                    onTap: null,

                    child: Container(
                        width: 119.0,
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

                  SizedBox(width: 10.0),

                  InkWell(
                    onTap: null,

                    child: Container(
                        width: 131.0,
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

                  SizedBox(width: 10.0),

                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
