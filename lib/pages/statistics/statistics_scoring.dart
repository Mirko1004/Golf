import 'package:flutter/material.dart';
import 'package:golf/pages/statistics/common/statistics_app_bar.dart';
import 'package:golf/utils/app_Box_Decoration.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class StatisticsScoring extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: getStatisticsAppBar(context, ''),

      body: Container(
        height: 600.0,
        padding: EdgeInsets.only(left: 20.0, top: 30.0),
        color: Colors.white,

        child: Column(
          children: <Widget>[

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Container(
                  height: 30.0,

                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[

                      Column(
                        children: <Widget>[

                          Row(
                            children: <Widget>[

                              Text('FAIRWAYS        ',
                                  style: AppStyles.getSFUITextMediumStyle(
                                      16.0,
                                      0.0,
                                      AppColors.lightBlack,
                                      FontWeight.w500)),

                              Text(' GIR        ',
                                  style: AppStyles.getSFUITextMediumStyle(
                                      16.0,
                                      0.0,
                                      AppColors.lightBlack,
                                      FontWeight.w500)),

                              Text(' PUTTING       ',
                                  style: AppStyles.getSFUITextMediumStyle(
                                      16.0,
                                      0.0,
                                      AppColors.lightBlack,
                                      FontWeight.w500)),

                              Text(' PAR      ',
                                  style: AppStyles.getSFUITextMediumStyle(
                                      16.0,
                                      0.0,
                                      AppColors.lightBlack,
                                      FontWeight.w500)),

                              Text(' RECOVERY     ',
                                  style: AppStyles.getSFUITextMediumStyle(
                                      16.0,
                                      0.0,
                                      AppColors.lightBlack,
                                      FontWeight.w500)),

                              Text(' SCORING   ',
                                  style: AppStyles.getSFUITextMediumStyle(
                                      16.0,
                                      0.0,
                                      AppColors.blackColor,
                                      FontWeight.w500)),
                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 7.0, left: 428.0),

                            child: Container(
                              width: 74.0,
                              height: 2.0,
                              decoration: BoxDecoration(
                                color: AppColors.greenColor2,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),

                Text('Scoring',
                    style: TextStyle(
                      fontFamily: 'SFUIText-Light',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.44,
                      color: Colors.black,
                    )),

              ],
            ),

            SizedBox(height: 20.0),

            Padding(
              padding: EdgeInsets.only(top: 40.0, right: 25.0),
              child: Image.asset('assets/images/statistics_scoring.png'),
            ),

            Expanded(

              child: Padding(
                padding: EdgeInsets.only(top: 202.0, bottom: 10.0),

                child: Container(
                  width: 134.0,
                  height: 5.0,
                  decoration: AppDecoration.bottomLine,
                ),

              ),

            ),
          ],
        ),
      ),
    );
  }
}
