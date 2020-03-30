import 'package:flutter/material.dart';
import 'package:golf/pages/common_widgets/modal_sheet.dart';
import 'package:golf/pages/community/calendar/selected_event/selected_event.dart';
import 'package:golf/repository/network/model/get_all_events_response.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';
import 'package:intl/intl.dart';

class PopularEventRow extends StatelessWidget {

  final Event _event;

  PopularEventRow(this._event);

  @override
  Widget build(BuildContext context) {

    DateTime eventStartDatetime = DateTime.fromMillisecondsSinceEpoch(int.parse(_event.dateStart)*1000);
    String startTime =  DateFormat('j').format(eventStartDatetime);
    DateTime eventEndDatetime = DateTime.fromMillisecondsSinceEpoch(int.parse(_event.dateEnd)*1000);
    String endTime =  DateFormat('j').format(eventEndDatetime);

    return InkWell(
      onTap: () => YudizModalSheet.show( context: context, child: SelectedEvent(_event), title: "EVENT", ),
      child: Container(
        padding: EdgeInsets.only(right: 10.0),
        width: 220.0,
        height: 220.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [

            getImageContainer(_event.cover),

            SizedBox(height: 5.0),

            Text( _event.author.profileTitle.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: AppStyles.getSurannaStyle(
                    16.0, 0.47, AppColors.blackColor4)),

            Text( _event.title,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.getSFUITextLightStyle2(
                    16.0, AppColors.blackColor4, FontWeight.w300)),

            SizedBox(height: 5.0),

            Text("$startTime - $endTime",
                style: AppStyles.getSFUITextLightStyle2(
                    14.0, AppColors.greyColor21, FontWeight.w300)),
          ],
        ),
      ),
    );
  }

  getImageContainer(String imageUrl) {
    return Container(
      width: 220.0,
      height: 123.0,
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
