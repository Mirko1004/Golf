import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:golf/base/base_bloc_widget.dart';
import 'package:golf/pages/common_widgets/search_widget.dart';
import 'package:golf/pages/common_widgets/table_view_refresh_widgets.dart';
import 'package:golf/pages/search/organization_row.dart';
import 'package:golf/pages/search/profiles_list_bloc.dart';
import 'package:golf/pages/search/profiles_row.dart';
import 'package:golf/repository/network/model/get_orgs_response.dart';
import 'package:golf/repository/network/model/profile_view_long.dart';
import 'package:golf/utils/app_colors.dart';

class ProfilesList extends StatefulWidget {

  final String organizationId;
  final bool fromDrawer;

  ProfilesList( this.organizationId, this.fromDrawer );

  @override
  State<StatefulWidget> createState() => _ProfilesListState(organizationId);
}

class _ProfilesListState extends State<ProfilesList> {

  final ProfilesListBloc _profilesListBloc;
  RefreshController _refreshController;

  _ProfilesListState(String organizationId) : _profilesListBloc = ProfilesListBloc(organizationId);

  _onSearch(String searchText ) {
    _profilesListBloc.searchString = searchText;
    _profilesListBloc.getData( false );
  }

  @override
  Widget build(BuildContext context) {

    double listPadding = 10.0;
    if(widget.fromDrawer)
      listPadding = 18.0;

    return BaseBlocWidget(
      _profilesListBloc,

      Container(
        color: Colors.white,
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only( left: listPadding, right: listPadding, bottom: 10.0 ),
              child: SearchWidget( _onSearch ),
            ),

            Container(
              height: 50.0,
              color: Colors.white,
              padding: EdgeInsets.symmetric( horizontal: listPadding ),
              child: StreamBuilder<bool>(
                initialData: true,
                stream: _profilesListBloc.isGetMembers,
                builder: (BuildContext context, AsyncSnapshot snapshot) {

                  BoxDecoration underline = BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: AppColors.greenColor),
                    ),
                    color: Colors.white,
                  );

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      InkWell(
                        onTap: () => _profilesListBloc.isGetMembers.value = true,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          decoration: snapshot.data ? underline : null,
                          child: Text( "PROFILES",
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

                      Padding( padding: EdgeInsets.only(left: 25.0), ),

                      InkWell(
                        onTap: () => _profilesListBloc.isGetMembers.value = false,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          decoration: !snapshot.data ? underline : null,
                          child: Text( "COUNTRY CLUBS",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 16.0,
                                  fontFamily: 'SFUIText-Medium',
//                                  fontWeight: FontWeight.w400,
                                  color: snapshot.data ? Color(0x80323643) : Color(0xff323643)
                              )
                          ),
                        ),
                      ),

                    ],
                  );
                },
              ),
            ),

            SizedBox(height: 20.0),

            Expanded(
              child: Container(
                    padding: EdgeInsets.symmetric( horizontal: listPadding),
                    child: StreamBuilder<bool>(
                        initialData: true,
                        stream: _profilesListBloc.isGetMembers,
                        builder: (BuildContext context, AsyncSnapshot snapshotIsGetMembers) {

                          bool isProfile = snapshotIsGetMembers.data;

                          return StreamBuilder(
                            initialData: List(),
                            stream: isProfile ? _profilesListBloc.memberProfileViewLongList : _profilesListBloc.organizations,
                            builder: (BuildContext context, AsyncSnapshot snapshot) {

                              _refreshController = RefreshController();

                              return MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: SectionTableView(
                                  numOfRowInSection: (int section) => isProfile ? _profilesListBloc.memberProfileViewLongList.value.length : _profilesListBloc.organizations.value.length,
                                  sectionCount: 1,
                                  cellAtIndexPath: (int section, int row) {
                                    if(isProfile){
                                      ProfileViewLong profileLong = _profilesListBloc.memberProfileViewLongList.value[row];
                                      List sports = profileLong.sports.map( (sport) => sport.name.toLowerCase() ).toList();
                                      return ProfilesRow( widget.fromDrawer, profileLong.profile_id, profileLong.profile_title, profileLong.profile_thumb_url, sports);
                                    } else {
                                      Organization organization = _profilesListBloc.organizations.value[row];
                                      return OrganizationRow( organization.title.toUpperCase(), organization.picture, organization.members, "18");
                                    }
                                  },
                                  refreshController: _refreshController,
                                  enablePullDown: true,
                                  enablePullUp: _profilesListBloc.isGetMembers.value ? _profilesListBloc.loadMoreMembers.value : _profilesListBloc.loadMoreOrgs.value,
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
      await _profilesListBloc.getData(false);
    } else
      await _profilesListBloc.getData(true);

    _refreshController.sendBack(up, RefreshStatus.completed);
  }

}


