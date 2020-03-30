import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getInterestsList(bool selected) {
  Widget row(String image, String text) {
    return Expanded(

      child: Column(
        children: <Widget>[
          Row(
              children: <Widget>[

                Image.asset(image),

                SizedBox(width: 15.0),

                Expanded(child: Text(text,
                    style: AppStyles.getSFUITextMediumStyle(
                        18.0, 0.9, AppColors.greyColor21, FontWeight.w500))),

                Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage( selected ? "assets/images/check_circle-checked.png" : "assets/images/check_circle.png",
                      ),
                    ),
                  ),
                )

              ],
            )
        ],
      ),
    );
  }

  return  Column(
      children: <Widget>[
        Row(children: <Widget>[ row ('assets/images/image-beauty.png', 'beauty')]),

        SizedBox(height: 25.0),

        Row(children: <Widget>[ row ('assets/images/image-education.png', 'education')]),

        SizedBox(height: 25.0),

        Row(children: <Widget>[ row ('assets/images/image-finance.png', 'finance')]),

        SizedBox(height: 25.0),

        Row(children: <Widget>[ row ('assets/images/image-health.png', 'health')]),

        SizedBox(height: 25.0),

        Row(children: <Widget>[ row ('assets/images/image-hospitality.png', 'hospitality')]),

        SizedBox(height: 25.0),

        Row(children: <Widget>[ row ('assets/images/image-mining.png', 'mining')]),

        SizedBox(height: 25.0),

        Row(children: <Widget>[ row ('assets/images/image-realestate.png', 'realestate')]),
      ],
    );

}
