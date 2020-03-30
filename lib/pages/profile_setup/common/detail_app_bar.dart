import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getDetailAppBar(BuildContext context, String title) {

  return AppBar(
    elevation: 0.0,
    titleSpacing: 0.0,
    centerTitle: false,
    backgroundColor: Colors.white,
    brightness: Brightness.dark,

    leading: InkWell(
      onTap: () => Navigator.of(context).pop(),

      child: Image.asset( "assets/images/back_arrow.png",
        height: 23.0,
        width: 23.0,
      ),
    ),

    title: Text( title,
        style: AppStyles.getSurannaStyle(24.0, 0.0, AppColors.blackColor)
    ),

  );
}