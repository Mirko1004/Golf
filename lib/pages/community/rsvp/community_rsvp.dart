import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:flutter_section_table_view/pullrefresh/src/smart_refresher.dart';
import 'package:golf/base/base_bloc_widget.dart';
import 'package:golf/pages/common_widgets/table_view_refresh_widgets.dart';
import 'package:golf/repository/network/model/profile_view_short.dart';
import 'package:golf/utils/app_styles.dart';

import 'community_rsvp_bloc.dart';
import 'community_rsvp_row.dart';

class CommunityRSVP extends StatefulWidget {
  @override
  _CommunityRSVPState createState() => _CommunityRSVPState();
}

class _CommunityRSVPState extends State<CommunityRSVP> {

  final CommunityRsvpBloc _communityRsvpBloc = CommunityRsvpBloc();
  RefreshController _refreshController;

  @override
  Widget build(BuildContext context) {

    double listPadding = 18.0;

    return BaseBlocWidget(
      _communityRsvpBloc,

      Container(
        color: Colors.white,

        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 20.0),

            Container(
              height: 30.0,
              padding: EdgeInsets.symmetric( horizontal: listPadding ),
              child: StreamBuilder<List<ProfileViewShort>>(
                initialData: List(),
                stream: _communityRsvpBloc.memberProfileViewShortList,
                builder: (BuildContext context, AsyncSnapshot snapshot) {

                  _refreshController = RefreshController();

                  if(snapshot.data.isEmpty)
                    return Text( "No pending friend requests",
                        style: AppStyles.getSFUITextMediumStyle(16.0, 0.0, Colors.black, FontWeight.w400)
                    ) ;

                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Text( "Friend Requests",
                        style: AppStyles.getSFUITextMediumStyle(16.0, 0.0, Colors.black, FontWeight.w400)
                    ),

                  );
                },
              ),
            ),

            SizedBox(height: 15.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric( horizontal: listPadding),
                child: StreamBuilder<List<ProfileViewShort>>(
                  initialData: List(),
                  stream: _communityRsvpBloc.memberProfileViewShortList,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {

                    _refreshController = RefreshController();

                    return MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: SectionTableView(
                        numOfRowInSection: (int section) => snapshot.data.length,
                        sectionCount: 1,
                        cellAtIndexPath: (int section, int row) {
                          ProfileViewShort profileShort = snapshot.data[row];
                          return CommunityRsvpRow( _communityRsvpBloc.acceptAccepted, _communityRsvpBloc.acceptedFriendsIdList,
                              profileShort.profile_id, profileShort.profile_title, profileShort.profile_thumb_url );
                        },
                        refreshController: _refreshController,
                        enablePullDown: true,
                        enablePullUp: _communityRsvpBloc.loadMoreMembers.value,
                        refreshHeaderBuilder: getRefreshHeaderWidget,
                        onRefresh: (up) => _refreshFriends(up),
                      ),

                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _refreshFriends(bool up) async {
    if (up) {
      await _communityRsvpBloc.getData(false);
    } else
      await _communityRsvpBloc.getData(true);

    _refreshController.sendBack(up, RefreshStatus.completed);
  }
}
