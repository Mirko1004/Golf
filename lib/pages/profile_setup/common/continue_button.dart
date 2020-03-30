import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getContinueButton(Function onTap) {

  return Padding(
    padding: EdgeInsets.only(top: 20.0,bottom:10.0),
    child: InkWell(
      onTap: onTap,
      child: Container(
          width: 350.0,
          height: 40,
          decoration: new BoxDecoration(
            color: AppColors.lightWhite2,
            border: new Border.all(
                color: AppColors.orangeColor, width: 1.0),
            borderRadius: new BorderRadius.horizontal(),
          ),
          child: Center(
            child: Text('CONTINUE',
                style: AppStyles.getSurannaStyle2(
                    22.0, 1.38, AppColors.greenColor,1.8)),
          )),
    ),
  );
}