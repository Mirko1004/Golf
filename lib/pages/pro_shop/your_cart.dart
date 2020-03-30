import 'package:flutter/material.dart';
import 'package:golf/pages/pro_shop/cart_app_bar.dart';
import 'package:golf/pages/pro_shop/cart_items.dart';
import 'package:golf/pages/pro_shop/cart_row.dart';
import 'package:golf/pages/pro_shop/price.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class YourChart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: getCartAppBar(),

      body: SingleChildScrollView(

        child: Column(
          children: <Widget>[
            getCartItems(),

            Container(
                padding: EdgeInsets.only(top: 20.0, left: 30.0),
                width: 440.0,
                height: 190.0,
                color: Colors.white,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Row(
                      children: <Widget>[
                        Image.asset('assets/images/seen_icon.png'),
                        SizedBox(width: 20.0),
                        Text(
                          'Shipping and Pickup options',
                          style: AppStyles.getSFUITextLight2(),
                        )
                      ],
                    ),

                    SizedBox(height: 15.0),

                    Row(
                      children: <Widget>[
                        Image.asset('assets/images/seen_icon.png'),
                        SizedBox(width: 20.0),
                        Text(
                          'Hassle free returns',
                          style: AppStyles.getSFUITextLight2(),
                        )
                      ],
                    ),

                    SizedBox(height: 20.0),

                    Text('NEED HELP?',
                        style: AppStyles.getSFUITextRegularStyle(
                            16.0, 0.0, AppColors.blackColor, FontWeight.w400)),

                    SizedBox(height: 20.0),

                    Text('If you would like to speak to one od our pro-shop',
                        style: AppStyles.getSFUITextLight2()),

                    SizedBox(height: 5.0),

                    Text('representatives you reach us here:',
                        style: AppStyles.getSFUITextLight2()),
                  ],
                )),

            getCartRow(),

            SizedBox(height: 15.0),

            price(),

          ],
        ),
      ),

    );
  }
}
