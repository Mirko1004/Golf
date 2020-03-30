import 'package:flutter/material.dart';
import 'package:golf/pages/pro_shop/shop_column.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class ProShop extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.only(top: 25.0, left: 9.0, right: 9.0),

          child: Column(
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Text(
                    'MEN',
                    style: AppStyles.getSFUITextMediumStyle(
                        16.0, 0.0, AppColors.blackColor, FontWeight.w500),
                  ),

                  Text('WOMEN',
                      style: AppStyles.getSFUITextMediumStyle(
                          16.0, 0.0, AppColors.lightBlack, FontWeight.w500)),

                  Text('NEW',
                      style: AppStyles.getSFUITextMediumStyle(
                          16.0, 0.0, AppColors.lightBlack, FontWeight.w500)),

                  Text('18THANDMAIN ',
                      style: AppStyles.getSFUITextMediumStyle(
                          16.0, 0.0, AppColors.lightBlack, FontWeight.w500)),

                ],
              ),

              Stack(
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 300.0),
                    child: Container(
                      width: 42.0,
                      height: 2.0,
                      decoration: BoxDecoration(
                        color: AppColors.greenColor2,
                      ),
                    ),
                  ),

                ],
              ),

              SizedBox(height: 15.0),

              Card(

                  child: ListTile(

                title: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Image.asset('assets/images/search2.png'),
                    hintStyle: AppStyles.getSFUITextLightStyle2(
                        20.0, AppColors.blackColor3, FontWeight.w300),
                    border: InputBorder.none,
                    hintText: 'search for a brand or item',
                  ),
                ),
              )),

              SizedBox(height: 20.0),

              //Image.asset('assets/images/others_images/3.0x/slide.png'),
              SizedBox(height: 20.0),

              getShopColumn(context),

            ],
          ),
        ),
      ),
    );
  }
}
