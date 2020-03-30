import 'package:flutter/material.dart';
import 'package:golf/pages/pro_shop/shop_all_box.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getShopColumn(BuildContext context) {

  return Column(
    children: <Widget>[

      Column(
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Column(
                children: <Widget>[

                  Image.asset('assets/images/others_images/oakley_holbrook.png',
                      height: 114.0, width: 114.0),

                  SizedBox(height: 10.0),

                  Text('OAKLEY',
                      style: AppStyles.getSurannaStyle2(
                          16.0, 0.5, Colors.black, 1.4)),

                  Text('HOLBROOK',
                      style: AppStyles.getSurannaStyle2(
                          16.0, 0.5, Colors.black, 1.4)),

                  Text('\$ 138.00', style: AppStyles.getSFUITextLight3()),

                ],
              ),

              Column(
                children: <Widget>[

                  Image.asset(
                      'assets/images/others_images/taylormade_classic.png'),

                  SizedBox(height: 10.0),

                  Text('TAYLORMADE',
                      style: AppStyles.getSurannaStyle2(
                          16.0, 0.5, Colors.black, 1.4)),

                  Text('CLASSIC',
                      style: AppStyles.getSurannaStyle2(
                          16.0, 0.5, Colors.black, 1.4)),

                  Text('\$ 150.00', style: AppStyles.getSFUITextLight3()),

                ],
              ),

              Column(
                children: <Widget>[

                  Image.asset('assets/images/others_images/cobra_fmax.png'),

                  SizedBox(height: 10.0),

                  Text('COBRA',
                      style: AppStyles.getSurannaStyle2(
                          16.0, 0.5, Colors.black, 1.4)),

                  Text('FMAX',
                      style: AppStyles.getSurannaStyle2(
                          16.0, 0.5, Colors.black, 1.4)),

                  Text('\$ 280.00', style: AppStyles.getSFUITextLight3()),

                ],
              ),
            ],
          ),
        ],
      ),

      Padding(padding: EdgeInsets.only(bottom: 20.0)),

      Container(
          height: 273.0,
          width: 440.0,
          color: AppColors.lightWhite2,

          child: Column(
            children: <Widget>[

              Text('139 NEW ARRIVALS',
                  style: AppStyles.getSurannaStyle(
                      20.0, 0.0, AppColors.blackColor)),

              Image.asset('assets/images/others_images/shoes.png'),

              Padding(padding: EdgeInsets.only(top: 20.0)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text('find your style for the fairways in ',
                      style: AppStyles.getSFUITextRegularStyle(
                          16.0, -0.01, Colors.black, FontWeight.w400)),

                  Text('new',
                      style: AppStyles.getSFUITextRegularStyle(
                          16.0, -0.01, AppColors.greenColor, FontWeight.w400)),

                ],
              )
            ],
          )),

      Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 30.0),
          color: Colors.white,

          child: Column(
            children: <Widget>[

              Text('T-SHIRTS & VESTS', style: AppStyles.getSurannaGolfClub()),

              Padding(padding: EdgeInsets.only(top: 20.0)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Container(
                    width: 170.0,

                    child: Column(
                      children: <Widget>[

                        Image.asset('assets/images/others_images/t-shirt1.png'),

                        Padding(padding: EdgeInsets.only(top: 15.0)),

                        Text('NO LAYERING UP',
                            style: AppStyles.getSurannaStyle2(
                                16.0, 0.5, Colors.black, 1.4)),

                        Text('\$105', style: AppStyles.getSFUITextLight3()),

                      ],
                    ),
                  ),

                  Container(
                    width: 170.0,

                    child: Column(
                      children: <Widget>[

                        Image.asset('assets/images/others_images/t-shirt2.png'),

                        Padding(padding: EdgeInsets.only(top: 15.0)),

                        Text('PUMA',
                            style: AppStyles.getSurannaStyle2(
                                16.0, 0.5, Colors.black, 1.4)),

                        Text(
                          '\$80',
                          textAlign: TextAlign.center,
                          style: AppStyles.getSFUITextLight3(),
                        ),

                      ],
                    ),
                  ),
                ],
              ),

              Padding(padding: EdgeInsets.only(top: 20.0)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Container(
                    width: 170.0,

                    child: Column(
                      children: <Widget>[

                        Image.asset('assets/images/others_images/t-shirt3.png'),

                        Padding(padding: EdgeInsets.only(top: 15.0)),

                        Text('NIKE',
                            style: AppStyles.getSurannaStyle2(
                                16.0, 0.5, Colors.black, 1.4)),

                        Text('\$229', style: AppStyles.getSFUITextLight3()),

                      ],
                    ),
                  ),

                  Container(
                    width: 170.0,

                    child: Column(
                      children: <Widget>[

                        Image.asset('assets/images/others_images/t-shirt4.png'),

                        Padding(padding: EdgeInsets.only(top: 15.0)),

                        Text('CALLAWAY',
                            style: AppStyles.getSurannaStyle2(
                                16.0, 0.5, Colors.black, 1.4)),

                        Text('\$820', style: AppStyles.getSFUITextLight3()),

                      ],
                    ),
                  ),
                ],
              ),
              getShopAllBox(),
            ],
          )),

      Container(
        height: 1.0,
        color: AppColors.greyColor13,
      ),

      Container(
          padding: EdgeInsets.only(top: 30.0),
          color: Colors.white,

          child: Column(
            children: <Widget>[

              Text('RECOMMENDED FOR YOU',
                  style: AppStyles.getSurannaGolfClub()),

              Padding(padding: EdgeInsets.only(top: 20.0)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Column(
                    children: <Widget>[

                      Image.asset(
                          'assets/images/others_images/t-shirt_nike.png'),

                      Padding(padding: EdgeInsets.only(top: 15.0)),

                      Text('NIKE',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      Text('\$250', style: AppStyles.getSFUITextLight3()),

                    ],
                  ),

                  Column(
                    children: <Widget>[

                      Image.asset(
                        'assets/images/others_images/shoes_callaway.png',
                        height: 147.0,
                        width: 114.0,
                      ),

                      Padding(padding: EdgeInsets.only(top: 15.0)),

                      Text('CALLAWAY',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      Text('\$470', style: AppStyles.getSFUITextLight3()),

                    ],
                  ),

                  Column(
                    children: <Widget>[

                      Image.asset(
                          'assets/images/others_images/shorts_ralph_lauren.png'),

                      Padding(padding: EdgeInsets.only(top: 15.0)),

                      Text('RALPH LAUREN',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      Text('\$580', style: AppStyles.getSFUITextLight3()),

                    ],
                  ),
                ],
              ),

              Padding(padding: EdgeInsets.only(top: 20.0)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Column(
                    children: <Widget>[

                      Image.asset(
                          'assets/images/others_images/callaway_bat.png'),

                      Padding(padding: EdgeInsets.only(top: 15.0)),

                      Text('CALLAWAY',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      Text('\$250', style: AppStyles.getSFUITextLight3()),

                    ],
                  ),

                  Column(
                    children: <Widget>[

                      Image.asset(
                        'assets/images/others_images/gfore_cap.png',
                        height: 147.0,
                        width: 114.0,
                      ),

                      Padding(padding: EdgeInsets.only(top: 15.0)),

                      Text('CALLAWAY',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      Text('\$150', style: AppStyles.getSFUITextLight3()),

                    ],
                  ),

                  Column(
                    children: <Widget>[

                      Image.asset(
                          'assets/images/others_images/gloves_oakley.png'),

                      Padding(padding: EdgeInsets.only(top: 15.0)),

                      Text('RALPH LAUREN',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      Text('\$180', style: AppStyles.getSFUITextLight3()),

                    ],
                  ),
                ],
              ),

              getShopAllBox(),

            ],
          )),

      Container(
        height: 1.0,
        color: AppColors.greyColor13,
      ),

      Container(
          padding: EdgeInsets.only(top: 30.0),
          color: Colors.white,

          child: Column(
            children: <Widget>[

              Text('SHOES', style: AppStyles.getSurannaGolfClub()),

              Padding(padding: EdgeInsets.only(top: 20.0)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Column(
                    children: <Widget>[

                      Image.asset(
                          'assets/images/others_images/shoes_doccus.png'),

                      Padding(padding: EdgeInsets.only(top: 15.0)),

                      Text('DOCCUS',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      Text('\$550', style: AppStyles.getSFUITextLight3()),

                    ],
                  ),

                  Column(
                    children: <Widget>[

                      Image.asset(
                        'assets/images/others_images/shoes_nike.png',
                        height: 114.0,
                        width: 114.0,
                      ),

                      Padding(padding: EdgeInsets.only(top: 15.0)),

                      Text('NIKE',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      Text('\$270', style: AppStyles.getSFUITextLight3()),

                    ],
                  ),

                  Column(
                    children: <Widget>[

                      Image.asset('assets/images/others_images/shoes_puma.png'),

                      Padding(padding: EdgeInsets.only(top: 15.0)),

                      Text('PUMA',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      Text('\$180', style: AppStyles.getSFUITextLight3()),

                    ],
                  ),
                ],
              ),

              getShopAllBox(),

            ],
          )),

      Container(
        height: 1.0,
        color: AppColors.greyColor13,
      ),

      Container(
          padding: EdgeInsets.only(top: 30.0),
          color: Colors.white,

          child: Column(
            children: <Widget>[

              Text('PANTS', style: AppStyles.getSurannaGolfClub()),

              Padding(padding: EdgeInsets.only(top: 20.0)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Column(
                    children: <Widget>[

                      Image.asset(
                          'assets/images/others_images/pants_adidas.png'),

                      Padding(padding: EdgeInsets.only(top: 15.0)),

                      Text('ADIDAS',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      Text('\$550', style: AppStyles.getSFUITextLight3()),

                    ],
                  ),
                  Column(
                    children: <Widget>[

                      Image.asset(
                        'assets/images/others_images/pants_nike.png',
                        height: 147.0,
                        width: 114.0,
                      ),

                      Padding(padding: EdgeInsets.only(top: 15.0)),

                      Text('NIKE',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      Text('\$270', style: AppStyles.getSFUITextLight3()),

                    ],
                  ),
                  Column(
                    children: <Widget>[

                      Image.asset('assets/images/others_images/pants_puma.png'),

                      Padding(padding: EdgeInsets.only(top: 15.0)),

                      Text('PUMA',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      Text('\$180', style: AppStyles.getSFUITextLight3()),

                    ],
                  ),
                ],
              ),

              getShopAllBox(),

            ],
          )),

      Container(
        height: 1.0,
        color: AppColors.greyColor13,
      ),

      Container(
          padding: EdgeInsets.only(top: 30.0),
          color: Colors.white,

          child: Column(
            children: <Widget>[

              Text('ESSENTIALS', style: AppStyles.getSurannaGolfClub()),

              Padding(padding: EdgeInsets.only(top: 20.0)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Column(
                    children: <Widget>[

                      Image.asset(
                          'assets/images/others_images/callaway_balls.png'),

                      Padding(padding: EdgeInsets.only(top: 15.0)),

                      Text('CALLAWAY',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      Text('(CUSTOM)',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      Text('\$350', style: AppStyles.getSFUITextLight3()),

                    ],
                  ),

                  Column(
                    children: <Widget>[

                      Image.asset(
                        'assets/images/others_images/oglethorpe_gold.png',
                        height: 114.0,
                        width: 114.0,
                      ),

                      Padding(padding: EdgeInsets.only(top: 15.0)),

                      Text('OGLETHORPE',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      Text('GOLD',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      Text('\$30', style: AppStyles.getSFUITextLight3()),

                    ],
                  ),

                  Column(
                    children: <Widget>[

                      Image.asset(
                        'assets/images/others_images/callaway2.png',
                        height: 106.0,
                        width: 114.0,
                      ),

                      Padding(padding: EdgeInsets.only(top: 17.0)),

                      Text('CALLAWAY',
                          style: AppStyles.getSurannaStyle2(
                              16.0, 0.5, Colors.black, 1.4)),

                      SizedBox(height: 17.0),

                      Text('\$80', style: AppStyles.getSFUITextLight3()),

                    ],
                  ),
                ],
              ),

              getShopAllBox(),

              SizedBox(height: 15.0),

              Container(
                height: 1.0,
                color: AppColors.greyColor13,
              ),

              Column(
                children: <Widget>[

                  Container(
                    color: Colors.white,

                    child: Center(
                      child: Text('BRANDS',
                          style: AppStyles.getSurannaStyle(
                              20.0, 0.0, AppColors.blackColor)),
                    ),
                  ),

                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 20.0),
                    height: 105.0,

                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[

                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Image.asset(
                                  'assets/images/others_images/brand_18thandmain.png'),

                              SizedBox(width: 16.0),

                              Image.asset(
                                  'assets/images/others_images/brand_callaway.png'),

                              SizedBox(width: 16.0),

                              Image.asset(
                                  'assets/images/others_images/brand_nike.png'),

                              SizedBox(width: 16.0),

                              Image.asset(
                                  'assets/images/others_images/brand_oakley.png'),

                              SizedBox(width: 16.0),

                              Image.asset(
                                  'assets/images/others_images/brand_adidas.png'),

                            ]),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
    ],
  );
}
