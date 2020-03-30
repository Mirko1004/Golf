import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getSkinsGame(){

  return  Padding(
    padding:EdgeInsets.fromLTRB(15.0,20.0,15.0,10.0),

     child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        Container(

          child: Row(
            children: <Widget>[

              Column(
                children: <Widget>[

                  Text('01',
                    style: AppStyles.getSurannaStyle2(44.0, -0.64, Colors.black, 0.6),
                  ),

                  Text('HOLE',
                    style: TextStyle(
                        fontFamily: 'SFUIText-Bold.otf',
                        fontSize: 13.0,
                        color: AppColors.blackColor4,
                        letterSpacing: 0.25,
                        fontWeight: FontWeight.w700

                    ),
                  )

                ],
              ),

              Padding(
                padding:EdgeInsets.only(bottom:38.0,left:10.0),
                child: Column(
                  children: <Widget>[

                    Text('PAR 4',
                        style: TextStyle(
                            fontFamily: 'SFUIText-Bold.otf',
                            fontSize: 13.0,
                            letterSpacing: 0.25,
                            color: AppColors.lightBlack7,
                            fontWeight: FontWeight.w700
                        )),

                    Text('HC 11',
                        style: TextStyle(
                            fontFamily: 'SFUIText-Bold.otf',
                            fontSize: 13.0,
                            letterSpacing: 0.25,
                            color: AppColors.lightBlack7,
                            fontWeight: FontWeight.w700
                        )),

                  ],
                ),
              ),

            ],
          ),
        ),

        Column(
          children: <Widget>[

            Text('SKINS GAME',
              style: AppStyles.getSurannaStyle2(20.0, 0.0, AppColors.blackColor, 0.6),
            ),

            SizedBox(height: 5.0),

            Text('July 10th, 2018',
              style: AppStyles.getRobotoLightStyle2(),
            )

          ],
        ),

        Container(
          child: Row(
            children: <Widget>[

              Column(
                children: <Widget>[

                  Text('449',
                    style: AppStyles.getSurannaStyle2(44.0, -0.64, Colors.black, 0.6),
                  ),

                  Image.asset(''),

                ],
              ),

              Padding(
                padding:EdgeInsets.only(left:10.0,bottom:38.0),
                child: Column(
                  children: <Widget>[

                    Text('C',
                        style: TextStyle(
                          fontFamily: 'SFUIText-Bold.otf',
                          fontSize: 13.0,
                          letterSpacing: 0.25,
                          color: AppColors.lightBlack7,
                          fontWeight: FontWeight.w700,
                        )),

                    Text('G',
                        style: TextStyle(
                          fontFamily: 'SFUIText-Bold.otf',
                          fontSize: 13.0,
                          letterSpacing: 0.25,
                          color: AppColors.lightBlack7,
                          fontWeight: FontWeight.w700,
                        )),

                  ],
                ),
              ),

            ],
          ),
        ),
      ],

    ),
  );

}