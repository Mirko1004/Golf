import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';

class AppStyles {
  static TextStyle get homeRow => TextStyle(
      letterSpacing: 0.12,
      fontSize: 10.0,
      fontFamily: 'SFUIText-Medium.otf',
      fontWeight: FontWeight.w600,
      color: Colors.black);

  static getSurannaStyle(double fontSize, double letterSpacing, Color color) {
    return TextStyle(
        fontFamily: 'Suranna-Regular',
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing);
  }

  static getSurannaGolfClub() {
    return TextStyle(
        fontFamily: 'Suranna-Regular',
        color: AppColors.blackColor,
        fontSize: 20.0,
        height: 0.6,
        letterSpacing: 0.77);
  }

  static getSurannaStyle2(
      double fontSize, double letterSpacing, Color color, double height) {
    return TextStyle(
      fontFamily: 'Suranna-Regular',
      color: color,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static getSFUITextLightStyle() {
    return TextStyle(
      fontWeight: FontWeight.w300,
      fontFamily: 'SFUIText-Light.otf',
      color: Colors.black,
      fontSize: 20.0,
    );
  }

  static getSFUITextLightStyle2(
      double fontSize, Color color, FontWeight fontWeight) {
    return TextStyle(
      fontWeight: fontWeight,
      fontFamily: 'SFUIText-Light.otf',
      color: color,
      fontSize: fontSize,
    );
  }

  static getSFUITextLightStyle3(
      double fontSize, Color color,height ) {
    return TextStyle(
      height: height,
      fontWeight: FontWeight.w300,
      fontFamily: 'SFUIText-Light.otf',
      color: color,
      fontSize: fontSize,
    );
  }

  static getSFUITextLight3() {
    return TextStyle(
      letterSpacing: -0.01,
      fontWeight: FontWeight.w300,
      fontFamily: 'SFUIText-Light.otf',
      color: Colors.black,
      fontSize: 16.0,
    );
  }

  static getSFUITextLight4() {
    return TextStyle(
      letterSpacing: 0.7,
      fontWeight: FontWeight.w300,
      fontFamily: 'SFUIText-Light.otf',
      color: AppColors.lightWhite4,
      fontSize: 14.0,
      height: 1.6,
    );
  }

  static getSFUITextLight5() {
    return TextStyle(
      letterSpacing: 1.2,
      fontWeight: FontWeight.w300,
      fontFamily: 'SFUIText-Light.otf',
      color: AppColors.orangeColor,
      fontSize: 24.0,
    );
  }

  static getSFUITextLight6() {
    return TextStyle(
      fontWeight: FontWeight.w300,
      fontFamily: 'SFUIText-Light.otf',
      color: AppColors.darkGrey,
      fontSize: 14.0,
    );
  }

  static getSFUITextSemiBold() {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'SFUIText-Semibold.otf',
      color: AppColors.orangeColor,
      fontSize: 18.0,
    );
  }

  static getSFUITextSemiBold2() {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'SFUIText-Semibold.otf',
      color: AppColors.blackColor4,
      fontSize: 18.0,
    );
  }

  static getDemiDannyStyle(
      double fontSize, Color color, FontWeight fontWeight, double height) {
    return TextStyle(
      height: height,
      fontWeight: fontWeight,
      fontFamily: 'SFUIText-Medium.otf',
      color: color,
      fontSize: fontSize,
    );
  }

  static getRobotoLightStyle(double height) {
    return TextStyle(
      height: height,
      fontWeight: FontWeight.w300,
      fontFamily: 'Roboto-Light.ttf',
      color: AppColors.darkGrey,
      fontSize: 16.0,
    );
  }

  static getRobotoLightStyle2() {
    return TextStyle(
      height: 1.4,
      fontWeight: FontWeight.w300,
      fontFamily: 'Roboto-Light.ttf',
      color: AppColors.darkGrey,
      fontSize: 14.0,
    );
  }

  static getRobotoLightStyle3() {
    return TextStyle(
      height: 1.4,
      fontWeight: FontWeight.w300,
      fontFamily: 'Roboto-Light.ttf',
      color: AppColors.darkGrey,
      fontSize: 12.0,
    );
  }

  static getRobotoLightStyle4() {
    return TextStyle(
      fontWeight: FontWeight.w300,
      fontFamily: 'Roboto-Light.ttf',
      color: AppColors.darkGrey,
      fontSize: 14.0,
    );
  }

  static getRobotoMediumStyle() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto-Medium.ttf',
      color: Colors.black,
      fontSize: 16.0,
    );
  }

  static getSFUITextMediumStyle(double fontSize, double letterSpacing,
      Color color, FontWeight fontWeight) {
    return TextStyle(
        fontWeight: fontWeight,
        fontFamily: 'SFUIText-Medium.otf',
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing);
  }

  static getSFUITextMediumStyle2() {
    return TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'SFUIText-Medium.otf',
        color: AppColors.blackColor7,
        fontSize: 14.0,
        );
  }

  static getSFUITextMediumStyle3() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'SFUIText-Medium.otf',
      color: AppColors.blackColor4,
      fontSize: 16.0,
    );
  }

  static getSFUITextRegularStyle(double fontSize, double letterSpacing,
      Color color, FontWeight fontWeight) {
    return TextStyle(
        fontWeight: fontWeight,
        fontFamily: 'SFUIText-Regular.otf',
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing);
  }

  static getBottomBox() {
    return TextStyle(
        fontFamily: 'Suranna-Regular',
        color: AppColors.greenColor,
        fontSize: 22.0,
        letterSpacing: 1.38,
        height: 1.8);
  }

  static getSFUITextLight() {
    return TextStyle(
      fontWeight: FontWeight.w300,
      fontFamily: 'SFUIText-Light.otf',
      color: Colors.black,
      fontSize: 20.0,
    );
  }

  static getSFUITextLight2() {
    return TextStyle(
      fontWeight: FontWeight.w300,
      fontFamily: 'SFUIText-Light.otf',
      color: AppColors.darkGrey,
      fontSize: 16.0,
    );
  }
}
