import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getSelectGender() {

  return Padding(
    padding: EdgeInsets.only(top: 35.0),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text(
          'select preferred gender for matching',
          style: AppStyles.getSFUITextLight(),
        ),

        SizedBox(height: 15.0),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            InkWell(
              onTap: null,
              child: Container(
                  width: 104.0,
                  height: 40,
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
                    child: Text('female',
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
                    child: Text('male',
                        style: AppStyles.getSFUITextSemiBold2()),

                  )),
            ),
          ],
        ),
      ],
    ),
  );
}
