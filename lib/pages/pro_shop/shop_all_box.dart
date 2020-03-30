import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getShopAllBox() {
  return Padding(
    padding: EdgeInsets.only(top: 40.0,bottom:20.0),
    child: InkWell(
      onTap: null,
      child: Container(
          width: 215.0,
          height: 45,
          decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(color: AppColors.orangeColor, width: 1.0),
            borderRadius: new BorderRadius.horizontal(),
          ),
          child: Center(
            child: Text('SHOP ALL', style: AppStyles.getBottomBox()),
          )),
    ),
  );
}
