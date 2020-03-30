import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:golf/pages/common_widgets/table_view_refresh_widgets.dart';
import 'package:golf/pages/community/calendar/calendar.dart';
import 'package:golf/pages/community/calendar/calendar_card.dart';
import 'package:golf/pages/community/calendar/community_calendar_bloc.dart';
import 'package:golf/repository/network/model/get_all_events_response.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';
import 'package:intl/intl.dart';

class CommunityCalendar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CommunityCalendar();
}

class _CommunityCalendar extends State<CommunityCalendar> {

  final CommunityCalendarBloc _communityCalendarBloc = CommunityCalendarBloc();
  RefreshController _refreshController;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[

//        Calendar( _communityCalendarBloc.setCurrentDate ),

        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 20.0),
            child: StreamBuilder<Map<DateTime, List<Event>>>(
              stream: _communityCalendarBloc.eventsMap,
              initialData: CommunityCalendarBloc.getEmptyMap(DateTime.now()),
              builder: (BuildContext context, AsyncSnapshot snapshot) {

                Map<DateTime, List<Event>> map = snapshot.data;

                _refreshController = RefreshController();

                return SectionTableView(
                  numOfRowInSection: (int section) {

                    if(section == 0){
                      return 1;
                    } else {

                      final key = _getKeyForSection(section-1, map);
                      return map[key].length == 0 ? 1 : map[key].length;

                    }

                  },
                  sectionCount: map.keys.length+1,
                  headerInSection: (section) {
                    if(section == 0)
                      return Container();
                    else
                      return getHeaderRow(section-1, map);
                  },
                  cellAtIndexPath: (int section, int row) {
                    if(section == 0)
                      return Calendar( _communityCalendarBloc.setCurrentDate );
                    else{
                      if(map[_getKeyForSection(section-1, map)].length == 0)
                        return getEmptyRow();
                      else
                        return CalendarCard( map[_getKeyForSection(section-1, map)][row] );
                    }
                  },
                  refreshController: _refreshController,
                  enablePullDown: true,
                  refreshHeaderBuilder: getRefreshHeaderWidget,
                  onRefresh: (up) => _refreshMessages(up),
                );

              },
            ),
          ),
        ),
      ],
    );
  }

  _refreshMessages(bool up) async {
      await _communityCalendarBloc.dataCache.getEvents(false);
    _refreshController.sendBack(up, RefreshStatus.completed);
  }

  DateTime _getKeyForSection(int section, Map<DateTime, List<Event>> map) => map.keys.toList()[section];

  getHeaderRow(int section, Map<DateTime, List<Event>> map){

    DateTime headerDateTime = _getKeyForSection(section, map);

    DateTime now = DateTime.now();
    String date =  DateFormat("EEE, MMM d yyyy").format(headerDateTime);

    String day = "";
    if( headerDateTime.year == now.year &&  headerDateTime.month == now.month &&  headerDateTime.day == now.day )
      day = "TODAY - $date";
    else if( headerDateTime.year == now.year &&  headerDateTime.month == now.month &&  headerDateTime.day == now.day+1 )
      day = "TOMORROW - $date";
    else{
      day = date;
    }

    return Text(day,
        style: AppStyles.getSurannaStyle( 16.0, 0.89, AppColors.blackColor4)
    );
  }

  getEmptyRow(){
    return Container(
      height: 80.0,
      child: Row(
        children: <Widget>[

          Spacer( flex: 2,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Container(
                width: 1.0,
                height: 58.0,
                color: AppColors.orangeColor,
              ),

              Padding( padding: EdgeInsets.only(left: 10.0),),

              Text("Nothing planned",
              style: TextStyle(
                fontFamily: 'SFUIText-Light.otf',
                color: Color(0x80323643),
                fontSize: 18.0, ),
              ),

            ],
          ),

          Spacer( flex: 8,),

        ],
      ),
    );
  }

}