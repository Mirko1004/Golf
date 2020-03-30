import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/home/home.dart';
import 'package:golf/pages/member_list/member_list.dart';
import 'package:golf/pages/profile_setup/common/continue_button.dart';
import 'package:golf/pages/profile_setup/common/detail_app_bar.dart';
import 'package:golf/pages/profile_setup/step4/profile_setup_4_bloc.dart';
import 'package:golf/pages/profile_setup/step4/progress_bar_4.dart';
import 'package:golf/repository/network/model/get_orgs_response.dart';
import 'package:golf/utils/app_styles.dart';

class ProfileSetup4 extends StatefulWidget {

  final bool isMale;
  final String userName;
  final String firstName;
  final String lastName;
  final String bio;
  final File image;
  final Organization organization;
  final List<int> sportIds;

  const ProfileSetup4(this.organization, this.sportIds, this.isMale, this.userName, this.firstName, this.lastName, this.bio, this.image);

  @override
  State<StatefulWidget> createState() => _ProfileSetup4State( this.organization, this.sportIds, this.isMale, this.userName, this.firstName, this.lastName, this.bio, this.image );
}

class _ProfileSetup4State extends State<ProfileSetup4> {

  final ProfileSetup4Bloc _profileSetup4Bloc;
  StreamSubscription _isSignedSubscription;

  _ProfileSetup4State( Organization organization, List<int> sportIds, bool isMale, String userName, String firstName, String lastName, String bio, File image ) :
        _profileSetup4Bloc = ProfileSetup4Bloc(organization, sportIds, isMale, userName, firstName, lastName, bio, image );

  @override
  void initState() {
    _isSignedSubscription = _profileSetup4Bloc.done.listen((done){
      if(done)
        Navigator.of(context).push(MaterialPageRoute( builder: (context) => Home() ) );
    });
    super.initState();
  }


  @override
  void dispose() {
    _isSignedSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocScaffoldWidget(
      _profileSetup4Bloc,

      getDetailAppBar(context, 'DIRECTORY'),

       Column(
          children: <Widget>[

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

                  progressBar4(),

                  Padding( padding: EdgeInsets.only(top: 10.0),),



                      Text('Connect with club members and staff in...',
                          style: TextStyle(
                              letterSpacing: 1.0,
                              decoration: TextDecoration.none,
                              fontSize: 16.0,
                              fontFamily: 'SFrancisco',
                              fontWeight: FontWeight.w300,
                              color: Color(0xE67a7a7a)
                          )
                      ),




                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      DropdownButton<String>(
                        value: _profileSetup4Bloc.dropDownOrganization.value.id,
                        icon: Image.asset("assets/images/clubs_drop_down_icon.png"),
                        onChanged: (String value) {
                          _profileSetup4Bloc.setSelectedOrganization(value);
                          setState(() { });
                        },
                        items: _profileSetup4Bloc.dataCache.organizations.value.map<DropdownMenuItem<String>>((organization) {
                          return DropdownMenuItem(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text( organization.title,
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 17.5,
                                      fontFamily: 'SFUIText-Medium',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black
                                  )
                              ),
                            ),
                            value: organization.id,
                          );
                        }).toList(),
                      ),

                    ],
                  ),

                ],
              ),
            ),


            StreamBuilder<Organization>(
                initialData: widget.organization,
                stream: _profileSetup4Bloc.dropDownOrganization,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Expanded(
                    child: MemberList(snapshot.data.id, false),
                  );
                }
            ),

            SafeArea(
              child: getContinueButton( () { _profileSetup4Bloc.saveData(); }),
            ),

          ],
        ),



      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
    );
  }

}
