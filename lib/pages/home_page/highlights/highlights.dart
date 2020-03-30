import 'package:flutter/material.dart';
import 'package:golf/pages/home_page/highlights/highlilghts_row.dart';
import 'package:golf/pages/home_page/home_page_bloc.dart';
import 'package:golf/pages/home_page/post_row/post_row_view_model.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class Highlights extends StatefulWidget {

  final HomePageBloc homePageBloc;

  const Highlights(this.homePageBloc);

  @override
  State<StatefulWidget> createState() => _HighlightsState();
}

class _HighlightsState extends State<Highlights> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text("HIGHLIGHTS",
                style: AppStyles.getSurannaStyle(
                    16.0, 0.47, AppColors.blackColor4)),
          ),


          Expanded(
            child: StreamBuilder<List<PostRowViewModel>>(
              stream: widget.homePageBloc.channelPostRowViewModelList,
              initialData: List(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {

                List<PostRowViewModel> data = snapshot.data;

                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: data.map<Widget>( (channelTimelinePost) => HighlightsRow(channelTimelinePost) ).toList(),
                );

              },
            ),
          ),

        ],
      ),
    );

  }
}