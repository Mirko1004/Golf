import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/common_widgets/search_widget.dart';
import 'package:golf/pages/common_widgets/table_view_refresh_widgets.dart';
import 'package:golf/pages/profile_setup/common/continue_button.dart';
import 'package:golf/pages/profile_setup/common/detail_app_bar.dart';
import 'package:golf/pages/profile_setup/step2/profile_setup_2_bloc.dart';
import 'package:golf/pages/profile_setup/step2/profile_setup_2_row.dart';
import 'package:golf/pages/profile_setup/step2/progress_bar_2.dart';
import 'package:golf/pages/profile_setup/step3/profile_setup_3.dart';
import 'package:golf/repository/network/model/get_orgs_response.dart';
import 'package:golf/utils/app_styles.dart';

class ProfileSetup2 extends StatefulWidget {

  final bool isMale;
  final String userName;
  final String firstName;
  final String lastName;
  final String bio;
  final File image;

  ProfileSetup2(this.isMale, this.userName, this.firstName, this.lastName, this.bio, this.image);

  @override
  State<StatefulWidget> createState() => _ProfileSetup2State();
}

class _ProfileSetup2State extends State<ProfileSetup2> {

  final ProfileSetup2Bloc _profileSetup2Bloc = ProfileSetup2Bloc();
  RefreshController _refreshController;

  _gotoStep3(){
    if(_profileSetup2Bloc.selectedOrganization.value != null){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileSetup3( _profileSetup2Bloc.selectedOrganization.value,
          widget.isMale, widget.userName, widget.firstName, widget.lastName, widget.bio, widget.image )));
    }
  }

  _onSearch( String searchText ) {
    _profileSetup2Bloc.searchString = searchText;
    _profileSetup2Bloc.getOrganizations(false);
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocScaffoldWidget(
      _profileSetup2Bloc,

      getDetailAppBar(context, 'COUNTRY CLUB'),

      Container(
        padding: EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 0.0),
        child: Column(
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('step', style: AppStyles.getSFUITextLightStyle()),
              ],
            ),

            progressBar2(),

            Padding( padding: EdgeInsets.only(top: 10.0),),

            Text('Find your Country Club from the list below or do a quick search. #represent',
                style: TextStyle(
                    letterSpacing: 1.0,
                    decoration: TextDecoration.none,
                    fontSize: 16.0,
                    fontFamily: 'SFrancisco',
                    fontWeight: FontWeight.w300,
                    color: Color(0xE67a7a7a)
                )
            ),



            SearchWidget( _onSearch ),

            Padding( padding: EdgeInsets.only(top: 10.0)),

            Expanded(
              child: StreamBuilder<List<Organization>>(
                initialData: List(),
                stream: _profileSetup2Bloc.organizations.stream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {

                  _refreshController = RefreshController();

                  return SectionTableView(
                    numOfRowInSection: (int section) => snapshot.data.length,
                    sectionCount: 1,
                    cellAtIndexPath: (int section, int row) {
                      Organization organization = snapshot.data[row];
                      return ProfileSetup2Row(_profileSetup2Bloc, organization.id, organization.title.toUpperCase(), organization.picture, organization.members, "18");
                    },
                    refreshController: _refreshController,
                    enablePullDown: true,
                    enablePullUp: _profileSetup2Bloc.loadMoreOrganizations.value,
                    refreshHeaderBuilder: getRefreshHeaderWidget,
                    onRefresh: (up) => _refreshMessages(up),
                  );

                },
              ),
            ),

            SafeArea(
              child: getContinueButton(() {
                _gotoStep3();
              }),
            ),


          ],
        ),

      ),


      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
    );
  }

  _refreshMessages(bool up) async {
    if (up) {
      await _profileSetup2Bloc.getOrganizations(false);
    } else
      await _profileSetup2Bloc.getOrganizations(true);

    _refreshController.sendBack(up, RefreshStatus.completed);
  }

}
