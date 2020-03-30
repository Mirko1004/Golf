import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:golf/base/base_bloc_widget.dart';
import 'package:golf/pages/common_widgets/search_widget.dart';
import 'package:golf/pages/common_widgets/table_view_refresh_widgets.dart';
import 'package:golf/pages/member_list/member_list_bloc.dart';
import 'package:golf/pages/member_list/member_row.dart';
import 'package:golf/repository/network/model/profile_view_long.dart';

class MemberList extends StatefulWidget {

  final String organizationId;
  final bool fromDrawer;

  MemberList( this.organizationId, this.fromDrawer );

  @override
  State<StatefulWidget> createState() => _MemberListState(organizationId);
}

class _MemberListState extends State<MemberList> {

  final MemberListBloc _memberListBloc;
  RefreshController _refreshController;

  _MemberListState(String organizationId) : _memberListBloc = MemberListBloc(organizationId);

  _onSearch(String searchText ) {
    _memberListBloc.searchString = searchText;
    _memberListBloc.getData( false );
  }

  @override
  Widget build(BuildContext context) {

    double listPadding = 10.0;
    if(widget.fromDrawer)
      listPadding = 18.0;

    return BaseBlocWidget(
      _memberListBloc,

      Container(
        color: Colors.white,
        child:
        Column(
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only( left: listPadding, right: listPadding, top: 10.0, bottom: 10.0 ),
              child: SearchWidget( _onSearch ),
            ),

            Container(
              height: 50.0,
              color: Colors.white,
              padding: EdgeInsets.symmetric( horizontal: listPadding ),
              child: StreamBuilder<bool>(
                initialData: true,
                stream: _memberListBloc.isGetMembers,
                builder: (BuildContext context, AsyncSnapshot snapshot) {

                  BoxDecoration underline = BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.black),
                    ),
                    color: Colors.white,
                  );

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      InkWell(
                        onTap: () => _memberListBloc.isGetMembers.value = true,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          decoration: snapshot.data ? underline : null,
                          child: Text( "Members",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16.0,
                                  fontFamily: 'SFUIText-Medium',
//                                    fontWeight: FontWeight.w400,
                                  color: snapshot.data ? Color(0xff323643) : Color(0x32323643)
                              )
                          ),
                        ),
                      ),

                      Padding( padding: EdgeInsets.only(left: 20.0), ),

                      InkWell(
                        onTap: () => _memberListBloc.isGetMembers.value = false,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          decoration: !snapshot.data ? underline : null,
                          child: Text( "Staff",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16.0,
                                  fontFamily: 'SFUIText-Medium',
//                                  fontWeight: FontWeight.w400,
                                  color: snapshot.data ? Color(0x32323643) : Color(0xff323643)
                              )
                          ),
                        ),
                      ),

                    ],
                  );
                },
              ),
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric( horizontal: listPadding),
                child: StreamBuilder<bool>(
                    initialData: true,
                    stream: _memberListBloc.isGetMembers,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {

                      return StreamBuilder<List<ProfileViewLong>>(
                        initialData: List(),
                        stream: _memberListBloc.isGetMembers.value ? _memberListBloc.memberPofileViewLongList : _memberListBloc.staffProfileViewLongList,
                        builder: (BuildContext context, AsyncSnapshot snapshot) {

                          _refreshController = RefreshController();

                          return MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: SectionTableView(
                              numOfRowInSection: (int section) => snapshot.data.length,
                              sectionCount: 1,
                              cellAtIndexPath: (int section, int row) {
                                ProfileViewLong profileLong = snapshot.data[row];
                                List sports = profileLong.sports.map( (sport) => sport.name.toLowerCase() ).toList();
                                return MemberRow( widget.fromDrawer, _memberListBloc.connectDisconnect, _memberListBloc.isGetMembers.value ? _memberListBloc.followedMembersIdList : _memberListBloc.followedStaffIdList, profileLong.profile_id, profileLong.profile_title, profileLong.profile_thumb_url, sports, profileLong.profile_data.description );
                              },
                              refreshController: _refreshController,
                              enablePullDown: true,
                              enablePullUp: _memberListBloc.isGetMembers.value ? _memberListBloc.loadMoreMembers.value : _memberListBloc.loadMoreStuff.value,
                              refreshHeaderBuilder: getRefreshHeaderWidget,
                              onRefresh: (up) => _refreshMessages(up),
                            ),

                          );


                        },
                      );

                    }
                ),

              ),

            ),

          ],
        ),

      ),
    );
  }

  _refreshMessages(bool up) async {
    if (up) {
      await _memberListBloc.getData(false);
    } else
      await _memberListBloc.getData(true);

    _refreshController.sendBack(up, RefreshStatus.completed);
  }

}