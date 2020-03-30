import 'package:flutter/material.dart';
import 'package:golf/pages/community/discover/popular_this_week/popular_this_week_row.dart';
import 'package:golf/pages/home_page/post_row/post_row_view_model.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class PopularThisWeek extends StatelessWidget {

  final List<PostRowViewModel> popularThisWeekModelList;

  PopularThisWeek( this.popularThisWeekModelList );

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[

        Container(
          padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text( 'POPULAR THIS WEEK',
                style: AppStyles.getSurannaStyle(
                    18.0, 1.0, AppColors.blackColor4),
              ),
            ],
          ),
        ),

        GridView.extent(
          padding: EdgeInsets.only(bottom: 20.0),
          physics: NeverScrollableScrollPhysics(),
          maxCrossAxisExtent: MediaQuery.of(context).size.width/2,
          shrinkWrap: true,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: popularThisWeekModelList.map<Widget>((postRowViewModel) => PopularThisWeekRow( postRowViewModel )).toList(),
        ),

      ],
    );

  }
}
