import 'package:flutter/material.dart';
import 'package:golf/pages/community/discover/discover_bloc.dart';
import 'package:golf/pages/community/discover/popular_events/popular_event_row.dart';
import 'package:golf/repository/network/model/get_all_events_response.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class PopularEvents extends StatelessWidget {

  final DiscoverBloc discoverBloc;

  PopularEvents(this.discoverBloc);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Container(
          padding: EdgeInsets.only(top: 20.0),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Text(
                'POPULAR EVENTS',
                style: AppStyles.getSurannaStyle(
                    18.0, 1.0, AppColors.blackColor4),
              ),

              InkWell(
                onTap: () => discoverBloc.dataCache.communityCurrentPage.value = 1,
                child: Row(
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
              ),

            ],
          ),
        ),

        Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
          height: 235.0,
          color: Colors.white,
          child: StreamBuilder<List<Event>>(
            stream: discoverBloc.dataCache.events,
            initialData: List(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              List<Event> events = snapshot.data;

              return ListView(
                scrollDirection: Axis.horizontal,
                children: events.map<Widget>((event) => PopularEventRow(event)).toList(),
              );

            },
          ),

        ),

        Container( height: 2.0, color: AppColors.orangeColor2, ),

      ],
    );

  }

}