import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getBottomButton(String text) {

  return Padding(
    padding: EdgeInsets.only(top: 20.0,bottom:10.0),

    child: Container(
          width: 343.0,
          height: 40,
          decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(
                color: AppColors.orangeColor, width: 1.0),
            borderRadius: new BorderRadius.horizontal(),
          ),

        child: Center(

            child: Text(text,
                style: AppStyles.getSurannaStyle2(
                    20.0, 1.38, AppColors.greenColor,1.8)),
          )),

  );
}