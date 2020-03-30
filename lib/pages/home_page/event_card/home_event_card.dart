import 'package:flutter/material.dart';
import 'package:golf/pages/home_page/event_card/no_event_card.dart';
import 'package:golf/pages/home_page/home_page_bloc.dart';
import 'package:golf/repository/network/model/get_all_events_response.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';
import 'package:intl/intl.dart';

class HomeEventCard extends StatelessWidget {

  final HomePageBloc _homePageBloc;

  HomeEventCard(this._homePageBloc);

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<List<Event>>(
      stream: _homePageBloc.dataCache.events,
      initialData: List(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {

        if(snapshot.data.isEmpty)
          return getNoEventCard(_homePageBloc);

        Event _event = snapshot.data.first;

        DateTime eventStartDatetime = DateTime.fromMillisecondsSinceEpoch(int.parse(_event.dateStart)*1000);
        String dayOfWeek =  DateFormat('EEE').format(eventStartDatetime);
        String time =  DateFormat('j').format(eventStartDatetime);

        return InkWell(
          onTap: () => _homePageBloc.dataCache.currentPage.value = 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Container(
                height: 67.0,
                width: 381.0,
                decoration: BoxDecoration(color: AppColors.lightWhite2, boxShadow: [
                  BoxShadow(
                    color: AppColors.greyColor27,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0,
                    spreadRadius: 0.0,
                  )
                ]),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 10.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text( dayOfWeek,
                              style: AppStyles.getSFUITextRegularStyle(12.0, 0.33,
                                  AppColors.greyColor19, FontWeight.w400)),
                          Text(
                            eventStartDatetime.day.toString(),
                            style: AppStyles.getSurannaStyle2(
                                40.0, 1.18, AppColors.lightBlack6, 1.2),
                          )

                        ],
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(left: 10.0),),

                    Expanded(
                      child: Wrap(
                        children: <Widget>[
                          Text(_event.title,
                              style: AppStyles.getSFUITextLightStyle2(
                                  18.0, Colors.black, FontWeight.w300)),
                        ],
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(left: 10.0),),

                    Row(
                      children: <Widget>[
                        Text( time,
                            style: AppStyles.getSFUITextMediumStyle(
                                20.0, 0.56, Colors.black, FontWeight.w500)),
                        SizedBox(width: 8.0),
                        Image.asset('assets/images/rightarrow2.png')
                      ],
                    ),

                    Padding(padding: EdgeInsets.only(left: 10.0),),

                  ],
                )),
          ),
        );

      },
    );

  }
}
