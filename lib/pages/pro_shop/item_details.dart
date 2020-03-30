import 'package:flutter/material.dart';
import 'package:golf/pages/pro_shop/you_may_also_like.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class ItemDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Image.asset('assets/images/back_arrow.png'),
        actions: <Widget>[Image.asset('assets/images/shop_cart1.png')],
      ),

      body: SingleChildScrollView(

        child: Column(
          children: <Widget>[

            Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 20.0, right: 20.0),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Image.asset('assets/images/blue_pants.png'),

                    Text(
                      'new season',
                      style: TextStyle(
                          fontFamily: 'SFUIText-Semibold.ttf',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.01,
                          color: AppColors.orangeColor),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text('RALPH LAUREN',
                            style: AppStyles.getSurannaStyle(
                                18.0, 0.8, Colors.black)),

                        Text('\$580', style: AppStyles.getSFUITextLight()),

                      ],
                    ),

                    Text(
                      'FAIRWAY SHORTS',
                      style: TextStyle(
                          fontFamily: 'SFUIText-Light.ttf',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.8,
                          color: Colors.black),
                    ),

                    Padding(padding: EdgeInsets.only(top: 30.0)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image.asset('assets/images/blue_circle.png'),
                        Image.asset('assets/images/red_circle.png'),
                        Image.asset('assets/images/white_circle.png'),
                        Image.asset('assets/images/black_circle.png'),

                        Container(height: 29.0, width: 1.0, color: AppColors.greyColor15),

                        Image.asset('assets/images/size_xs.png'),
                        Image.asset('assets/images/size_s.png'),
                        Image.asset('assets/images/size_m.png'),
                        Image.asset('assets/images/size_l.png'),
                      ],
                    ),

                    SizedBox(height: 15.0),

                    Container(
                      height: 1.0,
                      color: AppColors.greyColor16,
                    ),

                    SizedBox(height: 25.0),

                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Column(
                            children: <Widget>[

                              Image.asset('assets/images/heart2.png'),

                              SizedBox(height: 10.0),

                              Text('WISHLIST',
                                  style: AppStyles.getSFUITextRegularStyle(10.0,
                                      -0.01, Colors.black, FontWeight.w400)),

                            ],
                          ),

                          Column(
                            children: <Widget>[

                              Image.asset('assets/images/video_play.png'),

                              SizedBox(height: 10.0),

                              Text('VIDEO',
                                  style: AppStyles.getSFUITextRegularStyle(10.0,
                                      -0.01, Colors.black, FontWeight.w400)),

                            ],
                          ),

                          Column(
                            children: <Widget>[

                              Image.asset('assets/images/rightarrow.png'),

                              SizedBox(height: 10.0),

                              Text('SHARE',
                                  style: AppStyles.getSFUITextRegularStyle(10.0,
                                      -0.01, Colors.black, FontWeight.w400)),

                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30.0),

                    Text(
                      'DESCRIPTION',
                      style: AppStyles.getSFUITextRegularStyle(
                          16.0, -0.01, AppColors.greyColor17, FontWeight.w400),
                    ),

                    SizedBox(height: 30.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text('Product information',
                            style: AppStyles.getSFUITextRegularStyle(
                                16.0, -0.44, Colors.black, FontWeight.w400)),

                        Image.asset('assets/images/right_arrow7.png'),

                      ],
                    ),

                    SizedBox(height: 15.0),

                    Container(
                      height: 1.0,
                      color: AppColors.greyColor16,
                    ),

                    SizedBox(height: 15.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text('Size guide',
                            style: AppStyles.getSFUITextRegularStyle(
                                16.0, -0.44, Colors.black, FontWeight.w400)),

                        Image.asset('assets/images/right_arrow7.png'),

                      ],
                    ),

                    SizedBox(height: 15.0),

                    Container(
                      height: 1.0,
                      color: AppColors.greyColor16,
                    ),

                    SizedBox(height: 15.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Text('Reviews (287)',
                            style: AppStyles.getSFUITextRegularStyle(
                                16.0, -0.44, Colors.black, FontWeight.w400)),

                        Image.asset('assets/images/right_arrow7.png'),

                      ],
                    ),

                    SizedBox(height: 50.0),

                    Text('YOU MAY ALSO LIKE',
                        style: AppStyles.getSFUITextRegularStyle(16.0, -0.01,
                            AppColors.greyColor17, FontWeight.w400)),

                    SizedBox(height: 20.0),

                    getYouMayAlsoLike(),

                    Center(

                      child: InkWell(
                        onTap: null,

                        child: Container(
                            width: 343.0,
                            height: 50,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              border: new Border.all(
                                  color: AppColors.orangeColor, width: 1.0),
                              borderRadius: new BorderRadius.horizontal(),
                            ),

                            child: Center(
                              child: Text('BUY NOW',
                                  style: AppStyles.getBottomBox()),
                            )),
                      ),
                    ),

                    SizedBox(height: 30.0),

                  ],
                )),
          ],
        ),
      ),

    );
  }
}
