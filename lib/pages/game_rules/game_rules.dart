import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class GameRules extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
          backgroundColor: Colors.white,

          title: Text('GAME RULES',
              style:
                  AppStyles.getSurannaStyle(24.0, 0.0, AppColors.blackColor)),
          leading: Image.asset('assets/images/X.png')),

      body: SingleChildScrollView(

        child: Padding(

            padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),

            child: Column(children: <Widget>[

              Padding(padding: EdgeInsets.only(top: 30.0)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Text('SKINS',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.blackColor,
                          fontFamily: 'SFUIText-Medium.ttf',
                          fontWeight: FontWeight.w500)),

                  Text(
                    ' NASSAU',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: AppColors.lightBlack,
                        fontFamily: 'SFUIText-Medium.ttf',
                        fontWeight: FontWeight.w500),
                  ),

                  Text('WOLF',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.lightBlack,
                          fontFamily: 'SFUIText-Medium.ttf',
                          fontWeight: FontWeight.w500)),

                  Text('STABLEFORD',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.lightBlack,
                          fontFamily: 'SFUIText-Medium.ttf',
                          fontWeight: FontWeight.w500)),

                ],
              ),

              SizedBox(height: 5.0),

              Align(
                alignment: Alignment.topLeft,

                child: Container(
                  width: 49.0,
                  height: 2.0,
                  decoration: BoxDecoration(
                    color: AppColors.greenColor2,
                    border: Border.all(color: AppColors.greenColor2),
                    borderRadius: BorderRadius.all(Radius.elliptical(60, 45)),
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 20.0)),

              Padding(
                padding: EdgeInsets.only(top: 42.0),

                child: InkWell(
                  onTap: null,

                  child: Container(
                      width: 343.0,
                      height: 40,
                      decoration:
                          new BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: AppColors.lightBlack2,
                            blurRadius: 20.0,
                            offset: Offset(0.0, 0.0),
                            spreadRadius: 0.0)
                      ]),

                      child: Center(

                        child: Text('play skins',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SFrancisco',
                                letterSpacing: 1.0,
                                fontSize: 18.0)),

                      )),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 20.0),

                child: Container(
                  width: 134.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: AppColors.greyColor2,
                    border: Border.all(color: AppColors.greyColor2),
                    borderRadius: BorderRadius.all(Radius.elliptical(60, 45)),
                  ),
                ),

              ),

            ])),
      ),
    );
  }
}
