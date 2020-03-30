import 'dart:io';
import 'package:flutter/material.dart';
import 'package:golf/pages/profile_setup/common/continue_button.dart';
import 'package:golf/pages/profile_setup/step1/profile_setup_1_bloc.dart';
import 'package:golf/pages/profile_setup/step1/progress1.dart';
import 'package:golf/pages/profile_setup/step1/widgets.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

import 'name_lastname_form.dart';

getProfileSetup1Layout(
    ProfileSetup1Bloc profileSetup1Bloc,
    GlobalKey<FormState> formKey,
    TextEditingController userName,
    TextEditingController firstName,
    TextEditingController lastName,
    TextEditingController bio) {

  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
      child: Column(
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('step', style: AppStyles.getSFUITextLightStyle()),
            ],
          ),

          drawProgressBar(),

          Padding( padding: EdgeInsets.only(top: 10.0),),

          //Image container
          StreamBuilder<File>(
            stream: profileSetup1Bloc.imageFile,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null)
                return Container(
                  child:
                      Image(image: AssetImage('assets/images/user-avatar.png')),
                );
              else
                return CircleAvatar(
                  minRadius: 70.0,
                  maxRadius: 70.0,
                  backgroundImage: AssetImage(snapshot.data.path),
//                  child: Image.file(snapshot.data),
                );
            },
          ),

          Padding(
            padding: EdgeInsets.only(top: 9.0),
            child: Text('a photo of you',
                style: AppStyles.getSFUITextLightStyle()),
          ),

          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Text('Make it your best shot! This is key to better connected experience',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.w300)),
          ),

          takePhoto(profileSetup1Bloc),

          Padding(padding: EdgeInsets.only(top: 20.0)),

          NameLastnameForm(profileSetup1Bloc, formKey, firstName, lastName, userName, bio),

          Padding(padding: EdgeInsets.only(top: 20.0)),

          SafeArea(
            child: getContinueButton(() {
              if (formKey.currentState.validate())
                profileSetup1Bloc.continueToStep2();
            }),
          ),

        ],
      ),
    ),
  );
}
