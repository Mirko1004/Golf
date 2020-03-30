import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:flutter_section_table_view/pullrefresh/src/smart_refresher.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/common_widgets/modal_sheet.dart';
import 'package:golf/pages/common_widgets/table_view_refresh_widgets.dart';
import 'package:golf/pages/notifications/notifications_row.dart';
import 'package:golf/pages/profile_setup/common/detail_app_bar.dart';
import 'package:golf/pages/timeline_post/timeline_post_widget.dart';
import 'package:golf/repository/network/model/get_notifications_response.dart';

import 'notifications_bloc.dart';

class Notifications extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  final NotificationsBloc _notificationsBloc = NotificationsBloc();
  RefreshController _refreshController;
  StreamSubscription timeLineOpenPostStreamSubscription;


  @override
  void initState() {
    _notificationsBloc.markNotificationsRead();

    timeLineOpenPostStreamSubscription = _notificationsBloc.currentTimelinePostRowViewModel.listen((postRowViewModel){

      if(postRowViewModel != null){
        YudizModalSheet.show( context: context, child: TimelinePostWidget(postRowViewModel), title: "POST" );
        _notificationsBloc.currentTimelinePostRowViewModel.value = null;
      }

    });

    super.initState();
  }


  @override
  void dispose() {
    timeLineOpenPostStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocScaffoldWidget(

        _notificationsBloc,

        getDetailAppBar(context, 'NOTIFICATIONS'),

        Column(
          children: <Widget>[

            StreamBuilder<List<SysNotification>>(
              stream: _notificationsBloc.dataCache.notifications,
              initialData: List(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {

                _refreshController = RefreshController();

                return Expanded(
                  child: SectionTableView(
                    numOfRowInSection: (int section) => snapshot.data.length,
                    sectionCount: 1,
                    cellAtIndexPath: (int section, int row) => NotificationRow( snapshot.data[row], _notificationsBloc ),
                    refreshController: _refreshController,
                    enablePullDown: true,
                    enablePullUp: _notificationsBloc.dataCache.loadMoreNotifications.value,
                    refreshHeaderBuilder: getRefreshHeaderWidget,
                    onRefresh: (up) => _refreshMessages(up),
                  ),
                );
              },
            ),

          ],
        )

    );

  }

  _refreshMessages(bool up) async {
    if (up) {
      await _notificationsBloc.getData(false);
    } else
      await _notificationsBloc.getData(true);

    _refreshController.sendBack(up, RefreshStatus.completed);
  }
}