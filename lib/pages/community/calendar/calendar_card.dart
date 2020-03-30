import 'package:flutter/material.dart';
import 'package:golf/base/base_bloc_widget.dart';
import 'package:golf/pages/common_widgets/modal_sheet.dart';
import 'package:golf/pages/community/calendar/calendar_card/calendar_card_bloc.dart';
import 'package:golf/pages/community/calendar/selected_event/selected_event.dart';
import 'package:golf/repository/network/model/get_all_events_response.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';
import 'package:intl/intl.dart';

class CalendarCard extends StatefulWidget {
  final Event event;

  CalendarCard(this.event);

  @override
  State<StatefulWidget> createState() => _CalendarCardState(event);
}

class _CalendarCardState extends State<CalendarCard> {
  final CalendarCardBloc _calendarCardBloc;

  _CalendarCardState(Event event) : _calendarCardBloc = CalendarCardBloc(event);

  @override
  Widget build(BuildContext context) {
    return BaseBlocWidget(
      _calendarCardBloc,

        StreamBuilder<Event>(
          stream: _calendarCardBloc.event,
          initialData: widget.event,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            DateTime eventStartDatetime = DateTime.fromMillisecondsSinceEpoch(
                int.parse(snapshot.data.dateStart) * 1000);
            String startTime = DateFormat('j').format(eventStartDatetime);
            DateTime eventEndDatetime = DateTime.fromMillisecondsSinceEpoch(
                int.parse(snapshot.data.dateEnd) * 1000);
            String endTime = DateFormat('j').format(eventEndDatetime);

            Color cardColor = Colors.white;
            bool userHasReaction = snapshot.data.isLoggedUserMember ||
                snapshot.data.isLoggedUserIgnore ||
                snapshot.data.isLoggedUserInterested;
            if (userHasReaction) cardColor = Color(0xffFFFBF5);

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

            return Card(
              color: cardColor,
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () => YudizModalSheet.show( context: context, child: SelectedEvent(widget.event), title: "EVENT", ),
                        child: Row(
                          children: <Widget>[

                            Column(
                              children: <Widget>[

                                Text(startTime,
                                    style: AppStyles.getSurannaStyle2(
                                        16.0, 0.0, Colors.black, 0.6)),
                                Text(endTime,
                                    style: AppStyles.getSurannaStyle2(
                                        16.0, 0.0, AppColors.greyColor21, 1.6))
                              ],
                            ),

                            Padding(padding: EdgeInsets.only(left: 15.0)),

                            Container(
                              width: 1.0,
                              height: 58.0,
                              color: AppColors.orangeColor,
                            ),

                            Padding(padding: EdgeInsets.only(left: 15.0)),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    snapshot.data.title,
                                    style: AppStyles.getSFUITextLightStyle2(18.0,
                                        AppColors.blackColor4, FontWeight.w300),
                                  ),
                                  SizedBox(height: 8.0),

//                        Text('Fazios',
//                            style: AppStyles.getSFUITextRegularStyle(
//                                14.0, 0.0, Colors.black, FontWeight.w400)),
//                        SizedBox(height: 5.0),

                                  Text(
                                      '${snapshot.data.members.length} people going',
                                      style: AppStyles.getSFUITextMediumStyle(
                                          12.0,
                                          0.0,
                                          AppColors.greyColor21,
                                          FontWeight.w500)),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),

                      SizedBox(height: 10.0),
                      Container(
                          padding: EdgeInsets.only(top: 10.0, right: 50.0),
                          width: 310.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                onTap: () => _calendarCardBloc.joinEvent(2),
                                child: Text('Interested',
                                    style: AppStyles.getSFUITextMediumStyle(14.0,
                                        0.0, interestedColor, FontWeight.w500)),
                              ),
                              InkWell(
                                onTap: () => _calendarCardBloc.joinEvent(0),
                                child: Text('Going',
                                    style: AppStyles.getSFUITextMediumStyle(
                                        14.0, 0.0, goingColor, FontWeight.w500)),
                              ),
                              InkWell(
                                onTap: () => _calendarCardBloc.joinEvent(1),
                                child: Text('Ignore',
                                    style: AppStyles.getSFUITextMediumStyle(
                                        14.0, 0.0, ignoreColor, FontWeight.w500)),
                              ),
                            ],
                          )),
                    ],
                  )),
            );
          },
        )

    );
  }
}
