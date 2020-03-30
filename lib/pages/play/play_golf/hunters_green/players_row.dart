import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getPlayersRow(){

  return Padding(
    padding: EdgeInsets.only(left:15.0),

    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.grey ),

                    Padding(
                      padding: const EdgeInsets.only(left:10.0),

                      child: Container(
                        width: 160.0,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Text(
                              'Name Lastname',
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.getSFUITextMediumStyle(18.0, 0.0, AppColors.blackColor, FontWeight.w500),
                            ),

                            SizedBox(height: 5.0),

                             Row(
                                children: <Widget>[
                                  Text('handicap',
                                    style:TextStyle(
                                      fontFamily: 'Roboto-Light.ttf',
                                      fontSize: 16.0,
                                      color: AppColors.darkGrey,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),

                                  Text(' 20',
                                    style: AppStyles.getSFUITextMediumStyle(16.0, 0.0, AppColors.blackColor, FontWeight.w500),
                                  ),

                                ],

                              ),

                          ],

                        ),
                      ),
                    ),


          Column(
              children: <Widget>[

                Text('SCORE',
                style: AppStyles.getSFUITextRegularStyle(12.0, 0.33, AppColors.greyColor19, FontWeight.w400)),

                Row(
                  children: <Widget>[
                    Text('3',
                    style: AppStyles.getSurannaStyle2(30.0, 0.0, AppColors.greyColor7, 1.6),
                    ),

                    SizedBox(width: 10.0),

                    Container(
                      height: 41.0,
                      width: 39.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.blackColor,

                        ),

                        borderRadius: BorderRadius.all(
                          Radius.circular(2.0),
                        )

                      ),

                      child: Center(
                        child:Text('4',
                          style: AppStyles.getSurannaStyle2(30.0, 0.0, AppColors.blackColor, 1.4),
                        ),
                      ),

                    ),

                    SizedBox(width: 10.0),

                    Text('5',
                      style: AppStyles.getSurannaStyle2(30.0, 0.0, AppColors.greyColor7, 1.6),
                    ),

                  ],

                ),

                Text('winner',
                  style:AppStyles.getSFUITextMediumStyle(14.0, 0.0, AppColors.greenColor, FontWeight.w500) ,
                ),

              ],

           ),

          SizedBox(width: 10.0),

          Container(
            width: 5.0,
            height: 62.0,
            decoration: BoxDecoration(
              color: Colors.black,
                border: Border.all(
                  color: AppColors.blackColor,
                ),

                borderRadius: BorderRadius.all(
                  Radius.circular(2.0),
                )

            ),

          )

        ],
      ),
  );
}