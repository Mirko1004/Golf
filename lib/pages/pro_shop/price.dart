import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

price() {
  return Container(
    height: 157.0,
    width: 440.0,
    color: AppColors.lightWhite2,

    child: Padding(
        padding: EdgeInsets.only(left: 30.0, right: 20.0, top: 20.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Text('Subtotal \$1160',
                style: AppStyles.getSFUITextRegularStyle(
                    14.0, 0.0, AppColors.blackColor, FontWeight.w400)),

            Row(
              children: <Widget>[

                Text('Shipping \$200',
                    style: AppStyles.getSFUITextRegularStyle(
                        14.0, 0.0, AppColors.greenColor, FontWeight.w400)),

                SizedBox(width: 150.0),

                Text('total usd:',
                    style: AppStyles.getSFUITextRegularStyle(
                        16.0, 0.0, AppColors.greyColor18, FontWeight.w400)),

                Text('\$',
                    style: AppStyles.getSFUITextRegularStyle(
                        14.0, 0.0, AppColors.greenColor, FontWeight.w400)),

                Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Text('1360',
                      style: AppStyles.getSurannaStyle(
                          24.0, 0.0, AppColors.greenColor)),
                ),

              ],
            ),

            Center(

              child: InkWell(
                onTap: null,

                child: Container(
                    width: 363.0,
                    height: 50,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      border: new Border.all(
                          color: AppColors.orangeColor, width: 1.0),
                      borderRadius: new BorderRadius.horizontal(),
                    ),

                    child: Center(

                      child: Text('CHECKOUT', style: AppStyles.getBottomBox()),
                    )),

              ),
            ),
          ],
        )),
  );
}
