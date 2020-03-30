import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {

  final Function searchByDate;

  Calendar( this.searchByDate );

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TableCalendar(
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarController: _controller,
          rowHeight: 35.0,
          initialCalendarFormat: CalendarFormat.month,
          onDaySelected: (day, events) => widget.searchByDate(day),
          calendarStyle: CalendarStyle(
            renderSelectedFirst: true,
            holidayStyle: AppStyles.getSurannaStyle(16.0, 0.0, AppColors.blackColor5),
            selectedStyle: AppStyles.getSurannaStyle2(16.0, 0.0, Colors.white, 1.6),
            outsideStyle: AppStyles.getSurannaStyle2( 16.0, 0.0, AppColors.blackColor6, 1.6),
            weekdayStyle: AppStyles.getSurannaStyle2( 16.0, 0.0, AppColors.blackColor5, 1.6),
            outsideHolidayStyle: AppStyles.getSurannaStyle2( 16.0, 0.0, AppColors.blackColor5, 1.6),
            outsideWeekendStyle: AppStyles.getSurannaStyle2( 16.0, 0.0, AppColors.blackColor6, 1.6),
            todayStyle: AppStyles.getSurannaStyle2(16.0, 0.0, Colors.white, 1.6),
            weekendStyle: AppStyles.getSurannaStyle2( 16.0, 0.0, AppColors.blackColor5, 1.6),
            todayColor: AppColors.greenColor,
            selectedColor: Colors.red,
          ),
          headerStyle: HeaderStyle(
            titleTextStyle: AppStyles.getSFUITextLightStyle2( 16.0, AppColors.darkGrey, FontWeight.w300), formatButtonVisible: false,
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekendStyle: AppStyles.getSFUITextRegularStyle( 16.0, -0.3, AppColors.greyColor28, FontWeight.w400),
            weekdayStyle: AppStyles.getSFUITextRegularStyle( 16.0, -0.3, AppColors.greyColor28, FontWeight.w400),
          ),
        )
      ],
    );
  }
}
