import 'dart:io';
import 'package:flutter/material.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/profile_setup/common/continue_button.dart';
import 'package:golf/pages/profile_setup/common/detail_app_bar.dart';
import 'package:golf/pages/profile_setup/step3/profile_setup_3_bloc.dart';
import 'package:golf/pages/profile_setup/step3/progress_bar_3.dart';
import 'package:golf/pages/profile_setup/step4/profile_setup_4.dart';
import 'package:golf/repository/network/model/get_orgs_response.dart';
import 'package:golf/utils/app_styles.dart';

class ProfileSetup3 extends StatefulWidget {

  final bool isMale;
  final String userName;
  final String firstName;
  final String lastName;
  final String bio;
  final File image;
  final Organization _organization;

  ProfileSetup3(this._organization, this.isMale, this.userName, this.firstName, this.lastName, this.bio, this.image);

  @override
  State<StatefulWidget> createState() => _ProfileSetup3State();
}

class _ProfileSetup3State extends State<ProfileSetup3> {

  final ProfileSetup3Bloc _profileSetup3Bloc = ProfileSetup3Bloc();

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _goToStep3() {
    Navigator.of(context).push(MaterialPageRoute( builder: (context) => ProfileSetup4( widget._organization, _profileSetup3Bloc.sportsList.value,
      widget.isMale, widget.userName, widget.firstName, widget.lastName, widget.bio, widget.image ) ) );
  }

  @override
  Widget build(BuildContext context) {
    return BaseBlocScaffoldWidget(
      _profileSetup3Bloc,

      getDetailAppBar(context, 'INTERESTS'),

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

            progressBar3(),

            Padding( padding: EdgeInsets.only(top: 10.0),),

            Text('Tell us what you are interested in. You can select more than one.',
                style: TextStyle(
                    letterSpacing: 1.0,
                    decoration: TextDecoration.none,
                    fontSize: 16.0,
                    fontFamily: 'SFrancisco',
                    fontWeight: FontWeight.w300,
                    color: Color(0xE67a7a7a)
                )
            ),

            Padding( padding: EdgeInsets.only(top: 10.0),),

            Expanded(
              child: StreamBuilder<List<int>>(
                initialData: List(),
                stream: _profileSetup3Bloc.sportsList,
                builder: (BuildContext context, AsyncSnapshot snapshot) {

                  return ListView(
                    itemExtent: 90.0,
                    children: widget._organization.sports.map<Widget>((sport){
                      return sportRow( _profileSetup3Bloc, int.parse(sport.id), "${sport.name.toLowerCase()}", snapshot.data.contains(int.parse(sport.id)));
                    }).toList(),
                  );

                },

              ),
            ),


            SafeArea(
              child: getContinueButton( () => _goToStep3() ),
            ),


          ],
        ),

      ),

      backgroundColor: Colors.white,
    );
  }

}


sportRow( ProfileSetup3Bloc profileSetup3Bloc, int sportId, String text, bool selected ) {

  String image;
  if(sportId == 1)
    image = "assets/images/image-golfer.png";
  else if(sportId == 2)
    image = "assets/images/image-tennis.png";
  else if(sportId == 3)
    image = "assets/images/image-swimming.png";
  else if(sportId == 4)
    image = "assets/images/image-fitness.png";

  return  InkWell(
    onTap: ()=> profileSetup3Bloc.addRemoveSport(sportId),
    child: Row(
      children: <Widget>[

        Container(
          width: 80.0,
          height: 70.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage( image, ),
            ),
          ),
        ),

        Padding( padding: EdgeInsets.only(left: 20.0),),

        Text( text,
          style: TextStyle(
            fontFamily: 'SFrancisco',
            fontWeight: FontWeight.w600,
            color: Color(0xff8A9084),
            fontSize: 20.0,
          ),
        ),

        Spacer(),

        Container(
          width: 24.0,
          height: 24.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage( selected ? "assets/images/check_circle-checked.png" : "assets/images/check_circle.png",
              ),
            ),
          ),
        )

      ],

    ),
  );

}
