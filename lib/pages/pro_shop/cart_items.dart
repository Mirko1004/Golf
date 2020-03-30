import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getCartItems() {

  return Container(
      height: 325.0,
      color: AppColors.greyColor8,
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Container(
              height: 138.0,
              width: 361.0,
              color: Colors.white,

              child: Row(
                children: <Widget>[

                  Image.asset('assets/images/pants_small.png'),

                  Padding(
                    padding: EdgeInsets.only(left: 20.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text('RALPH LAUREN',
                            style: AppStyles.getSurannaStyle(
                                18.0, 0.56, Colors.black)),

                        Text('Fairway shorts',
                            style: AppStyles.getSurannaStyle2(
                                18.0, 0.56, Colors.black, 0.9)),

                        SizedBox(height: 10.0),

                        Row(
                          children: <Widget>[

                            Image.asset('assets/images/blue_circle_empty.png'),

                            SizedBox(width: 20.0),

                            Image.asset('assets/images/size_m2.png'),

                          ],
                        ),

                        SizedBox(height: 10.0),

                        Text(
                          '\$580',
                          style: AppStyles.getSFUITextLightStyle2(
                              18.0, Colors.black, FontWeight.w300),
                        )

                      ],
                    ),
                  ),

                  Padding(
                      padding: EdgeInsets.only(left: 70.0),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                          Image.asset('assets/images/green_plus.png'),

                          Text('1',
                              style: AppStyles.getSFUITextMediumStyle(
                                  20.0, 0.0, Colors.black, FontWeight.w500)),

                          Image.asset('assets/images/minus.png'),

                        ],
                      )),
                ],
              )),

          SizedBox(height: 20.0),

          Container(
              height: 138.0,
              width: 361.0,
              color: Colors.white,

              child: Row(
                children: <Widget>[

                  Image.asset('assets/images/small_callaway_bat.png'),

                  Padding(

                    padding: EdgeInsets.only(left: 20.0),
                    child: Container(
                      height: 120.0,
                      width: 210.0,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text('CALLAWAY',
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.getSurannaStyle(
                                  18.0, 0.56, Colors.black)),

                          Text('Golf GBB Epic Driver',
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.getSurannaStyle2(
                                  18.0, 0.56, Colors.black, 0.9)),

                          SizedBox(height: 20.0),

                          Text(
                            '\$580',
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.getSFUITextLightStyle2(
                                18.0, Colors.black, FontWeight.w300),

                          )
                        ],
                      ),
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      Image.asset('assets/images/green_plus.png'),

                      Text('1',
                          style: AppStyles.getSFUITextMediumStyle(
                              20.0, 0.0, Colors.black, FontWeight.w500)),

                      Image.asset('assets/images/minus.png'),

                    ],
                  ),
                ],
              )),
        ],
      ));
}
