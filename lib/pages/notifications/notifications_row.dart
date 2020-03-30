import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:golf/pages/home_page/post_row/widgets/post_posted_ago.dart';
import 'package:golf/repository/network/model/get_notifications_response.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';
import 'package:golf/utils/utils.dart';

import 'notifications_bloc.dart';

class NotificationRow extends StatelessWidget {

  final SysNotification _sysNotification;
  final NotificationsBloc _notificationsBloc;

  const NotificationRow(this._sysNotification, this._notificationsBloc, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () => _notificationsBloc.processNotification(_sysNotification),
      child: Column(
        children: <Widget>[

          Container(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            color: AppColors.greyColor8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.grey,
                  backgroundImage: CachedNetworkImageProvider( _sysNotification.actionOwnerThumb ),
                ),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Html(
                          data: _sysNotification.contentParsed,
                          defaultTextStyle: AppStyles.getSFUITextRegularStyle(16.0, 0.0,
                              AppColors.blackColor, FontWeight.w400),
                        ),

                        SizedBox(
                          height: 10.0,
                        ),

                        PostPostedAgo(postedAgoString( int.parse(_sysNotification.date) )),

                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),

          Container(
            color: AppColors.greyColor,
            height: 1.0,
          ),

        ],
      ),
    );
  }
}
