import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getWeatherRow() {
  return Container(
      color: Colors.white,
      child: Padding(
          padding: EdgeInsets.only(left: 10.0, top: 15.0, right: 10.0),
          child: Row(
            children: <Widget>[
              Image.asset('assets/images/weather.png'),
              Padding(
                padding: EdgeInsets.only(left: 25.0, top: 15.0, right: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('WEATHER TODAY',
                        style: AppStyles.getSFUITextRegularStyle(12.0, 0.33,
                            AppColors.greyColor19, FontWeight.w400)),
                    Text(
                      '27°C',
                      style: AppStyles.getSurannaStyle2(
                          40.0, 1.18, Colors.black, 1.3),
                    )
                  ],
                ),
              ),
            ],
          )));
}
