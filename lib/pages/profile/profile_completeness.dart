import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getProfileCompleteness() {

  return Padding(
    padding: EdgeInsets.only(top: 18.0),

    child: Container(
      decoration: BoxDecoration(
        boxShadow: [

          BoxShadow(
              color: AppColors.greyColor22,
              offset: Offset(0.0, 2.0),
              blurRadius: 6.0,
              spreadRadius: 0.0)
        ],
      ),

      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.none,
                        image:
                            AssetImage("assets/images/profile_completenes.png"),
                      ),
                    ),
                  ),

                  Expanded(

                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text(
                            'Profile Completeness',
                            maxLines: 3,
                            style: AppStyles.getSFUITextLightStyle2(
                                18.0, AppColors.blackColor, FontWeight.w300),
                          ),

                          SizedBox(height: 10.0),

                          Text(
                              "You’re almost there! Add your match-making preference to connect with like-minded members.",
                              style: AppStyles.getSFUITextRegularStyle(14.0,
                                  0.0, AppColors.greyColor21, FontWeight.w400)),

                          SizedBox(height: 10.0),

                          Flex(
                            direction: Axis.horizontal,
                            children: <Widget>[

                              Expanded(
                                child: Container(
                                  height: 26.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: AppColors.orangeColor,
                                      )),

                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Center(
                                      child: Text(
                                        'complete your profile',
                                        style: AppStyles.getSFUITextMediumStyle(
                                            14.0,
                                            0.0,
                                            AppColors.greenColor,
                                            FontWeight.w500),
                                      ),
                                    ),
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
