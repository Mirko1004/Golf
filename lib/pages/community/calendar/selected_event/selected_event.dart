import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:golf/base/base_bloc_widget.dart';
import 'package:golf/pages/community/calendar/calendar_card/calendar_card_bloc.dart';
import 'package:golf/repository/network/model/get_all_events_response.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';
import 'package:intl/intl.dart';

class SelectedEvent extends StatefulWidget {
  final Event event;

  SelectedEvent(this.event);

  @override
  State<StatefulWidget> createState() => _SelectedEventState(event);
}

class _SelectedEventState extends State<SelectedEvent> {
  final CalendarCardBloc _calendarCardBloc;

  _SelectedEventState(Event event)
      : _calendarCardBloc = CalendarCardBloc(event);

  @override
  void dispose() {
    _calendarCardBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocWidget(
      _calendarCardBloc,
      Container(
        child: StreamBuilder<Event>(
          stream: _calendarCardBloc.event,
          initialData: widget.event,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            DateTime eventStartDatetime = DateTime.fromMillisecondsSinceEpoch(
                int.parse(snapshot.data.dateStart) * 1000);
//            String startTime = DateFormat('yyyy MM dd, EEE, jm').format(eventStartDatetime);
            String startTime =
                DateFormat.jm("en_US").format(eventStartDatetime);
            DateTime eventDaytime = DateTime.fromMillisecondsSinceEpoch(
                int.parse(snapshot.data.dateEnd) * 1000);
            String dayTime = DateFormat.EEEE("en_US").format(eventDaytime);

            bool userHasReaction = snapshot.data.isLoggedUserMember ||
                snapshot.data.isLoggedUserIgnore ||
                snapshot.data.isLoggedUserInterested;

            Color interestedColor = AppColors.greenColor;
            Color goingColor = AppColors.greenColor;
            Color ignoreColor = AppColors.greenColor;
            if (userHasReaction) {
              interestedColor = snapshot.data.isLoggedUserInterested
                  ? AppColors.greenColor
                  : AppColors.greyColor;
              goingColor = snapshot.data.isLoggedUserMember
                  ? AppColors.greenColor
                  : AppColors.greyColor;
              ignoreColor = snapshot.data.isLoggedUserIgnore
                  ? AppColors.greenColor
                  : AppColors.greyColor;
            }

            return Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(dayTime.toUpperCase(),
                          style: AppStyles.getSurannaStyle(
                              20.0, 1.43, AppColors.blackColor4)),
                      getImageContainer(widget.event.cover, context, snapshot),
                      SizedBox(height: 20.0),
                      Text(dayTime,
                          style: AppStyles.getSFUITextLightStyle2(
                              16.0, Colors.black, FontWeight.w300)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 10.0),
                              Text('Starts ' + startTime,
                                  style: AppStyles.getSFUITextLightStyle2(
                                      16.0, Colors.black, FontWeight.w300)),
                            ],
                          ),

//                              Padding(padding: EdgeInsets.only(left: 15.0)),

//                              Padding(padding: EdgeInsets.only(left: 15.0)),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Html(
                        data: widget.event.description,
                        defaultTextStyle: AppStyles.getSFUITextLightStyle2(
                            16.0, AppColors.darkGrey, FontWeight.w300),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text(
                            '${snapshot.data.members.length} people going',
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.getSFUITextMediumStyle(12.0, 0.0,
                                AppColors.greyColor21, FontWeight.w500)),
                      ),
                      Container(
                          width: 270.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                onTap: () => _calendarCardBloc.joinEvent(2),
                                child: Text('Interested',
                                    style: AppStyles.getSFUITextMediumStyle(
                                        14.0,
                                        0.0,
                                        interestedColor,
                                        FontWeight.w500)),
                              ),
                              InkWell(
                                onTap: () => _calendarCardBloc.joinEvent(0),
                                child: Text('Going',
                                    style: AppStyles.getSFUITextMediumStyle(
                                        14.0,
                                        0.0,
                                        goingColor,
                                        FontWeight.w500)),
                              ),
                              InkWell(
                                onTap: () => _calendarCardBloc.joinEvent(1),
                                child: Text('Ignore',
                                    style: AppStyles.getSFUITextMediumStyle(
                                        14.0,
                                        0.0,
                                        ignoreColor,
                                        FontWeight.w500)),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 30.0),
                  child: Container(
                    height: 2.0,
                    color: AppColors.orangeColor2,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

getImageContainer(
    String imageUrl, BuildContext context, AsyncSnapshot snapshot) {
  DateTime eventStartDatetime = DateTime.fromMillisecondsSinceEpoch(
      int.parse(snapshot.data.dateStart) * 1000);
  String startTime = DateFormat.d("en_US").format(eventStartDatetime);
  DateTime eventMonth = DateTime.fromMillisecondsSinceEpoch(
      int.parse(snapshot.data.dateStart) * 1000);
  String monthTime = DateFormat.MMM("en_US").format(eventMonth);
  return Container(
    height: 200.0,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fitHeight,
        image: CachedNetworkImageProvider(imageUrl),
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.0, 0.99],
            colors: <Color>[Color(0xbf131E06), Color(0x0a000000)]),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(monthTime,
                    style: AppStyles.getSFUITextRegularStyle(
                        12.0, 0.33, Colors.white, FontWeight.w400)),
                SizedBox(width: 15.0),
                Expanded(
                  child: Text(
                    snapshot.data.title,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.getSFUITextRegularStyle(
                        20.0, 0.0, Colors.white, FontWeight.w400),
                  ),
                ),
              ],
            ),
            Text(startTime,
                style:
                    AppStyles.getSurannaStyle2(40.0, 0.0, Colors.white, 1.2)),
          ],
        ),
      ),
    ),
  );
}
