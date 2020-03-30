import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class BrowseByCategories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[

        Container(
          padding: EdgeInsets.only(top: 20.0),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'BROWSE BY CATEGORIES',
                style: AppStyles.getSurannaStyle(
                    18.0, 1.0, AppColors.blackColor4),
              ),
              Row(
                children: <Widget>[
                  Text('View all  ',
                      style: AppStyles.getSFUITextMediumStyle(
                          14.0,
                          0.0,
                          AppColors.greenColor,
                          FontWeight.w500)),
                  Image.asset('assets/images/rightarrow2.png'),
                ],
              ),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
          height: 125.0,
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset('assets/images/dine_out.png'),
                  SizedBox(width: 10.0),
                  Image.asset('assets/images/image_golf.png'),
                  SizedBox(width: 10.0),
                  Image.asset('assets/images/water.png'),
                ],
              ),
            ],
          ),
        ),

        Container( height: 2.0, color: AppColors.orangeColor2, ),

      ],
    );

  }
}
