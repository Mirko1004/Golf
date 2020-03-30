import 'dart:async';
import 'package:flutter/material.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/profile_setup/step1/profile_setup_1_bloc.dart';
import 'package:golf/pages/profile_setup/step1/profile_setup_1_layout.dart';
import 'package:golf/pages/profile_setup/step2/profile_setup_2.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';
import 'package:golf/utils/utils.dart';

class ProfileSetup1 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ProfileSetup1State();
}

class _ProfileSetup1State extends State<ProfileSetup1> {

  final ProfileSetup1Bloc _profileSetup1Bloc = ProfileSetup1Bloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _bio = TextEditingController();
  StreamSubscription _isSignedSubscription;

  @override
  void initState() {

    if( isInDebugMode ){
      _username.text = "UserName First LastName";
      _firstName.text = "FirstName";
      _lastName.text = "LastName";
      _bio.text = "Some short biography about me";
    }

    _isSignedSubscription = _profileSetup1Bloc.done.listen((done){
      if(done)
        Navigator.of(context).push(MaterialPageRoute( builder: (context) => ProfileSetup2( _profileSetup1Bloc.isMale.value, _username.text, _firstName.text, _lastName.text, _bio.text, _profileSetup1Bloc.imageFile.value ) ) );
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
      _profileSetup1Bloc,

      AppBar(
        elevation: 0.0,
        titleSpacing: 0.0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only( left: 30.0),
          child: Text( "PROFILE SETUP",
              style: AppStyles.getSurannaStyle(24.0, 0.0, AppColors.blackColor)
          ),
        ),
      ),

      getProfileSetup1Layout(_profileSetup1Bloc, _formKey, _username, _firstName, _lastName, _bio),

      backgroundColor: Colors.white,
    );
  }

}
