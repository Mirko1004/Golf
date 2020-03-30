import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getBetting() {

  return Padding(
    padding: EdgeInsets.only(top: 20.0),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Padding(
          padding: EdgeInsets.only(right: 10.0),

          child: Text('interested in golfing rounds for betting?',
              style: AppStyles.getSFUITextLight()),
        ),

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
                        width: 90.0,
                        height: 40,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          border: new Border.all(
                              color: AppColors.greyColor29, width: 1.0),
                        ),

                        child: Center(

                          child: Text('never',
                              style: AppStyles.getSFUITextSemiBold2()),
                        )),
                  ),

                  SizedBox(width: 10.0),

                  InkWell(
                    onTap: null,

                    child: Container(
                        width: 156.0,
                        height: 40,
                        decoration: new BoxDecoration(
                          color: AppColors.greenColor,
                        ),

                        child: Center(

                          child: Text("I'm open to it",
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

                          child: Text('always',
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
