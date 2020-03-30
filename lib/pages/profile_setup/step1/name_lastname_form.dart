import 'package:flutter/material.dart';
import 'package:golf/localization/localization.dart';
import 'package:golf/pages/profile_setup/step1/profile_setup_1_bloc.dart';
import 'package:golf/pages/profile_setup/step1/widgets.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class NameLastnameForm extends StatefulWidget {
  final ProfileSetup1Bloc profileSetup1Bloc;
  final GlobalKey<FormState> _formKey;
  final TextEditingController _userName;
  final TextEditingController _firstName;
  final TextEditingController _lastName;
  final TextEditingController _bio;

  NameLastnameForm(this.profileSetup1Bloc, this._formKey, this._firstName, this._lastName, this._userName, this._bio);

  @override
  State<StatefulWidget> createState() => _NameLastnameFormState();
}

class _NameLastnameFormState extends State<NameLastnameForm> {

  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _userNameFocus = FocusNode();
  final FocusNode _bioFocus = FocusNode();


  String userNameValidator(String input) {
    if (input == null || input.trim().isEmpty)
      return "Username must be not be empty!";

    return null;
  }

  String firstNameValidator(String input) {
    if (input == null || input.trim().isEmpty)
      return Localization.of(context).firstname_empty;

    return null;
  }

  String lastNameValidator(String input) {
    if (input == null || input.trim().isEmpty)
      return Localization.of(context).lastname_empty;

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Form(
          key: widget._formKey,
//          autovalidate: true,
          child: Column(
            children: <Widget>[

              TextFormField(
                controller: widget._userName,
                validator: userNameValidator,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.greyColor)),
                  labelText: 'username',
                  labelStyle: AppStyles.getSFUITextLightStyle(),
                ),
                focusNode: _userNameFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  _userNameFocus.unfocus();
                  FocusScope.of(context).requestFocus(_firstNameFocus);
                },
              ),

              Padding( padding: EdgeInsets.only(top: 10.0), ),

              TextFormField(
                controller: widget._firstName,
                validator: firstNameValidator,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.greyColor)),
                  labelText: 'first name',
                  labelStyle: AppStyles.getSFUITextLightStyle(),
                ),
                focusNode: _firstNameFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  _firstNameFocus.unfocus();
                  FocusScope.of(context).requestFocus(_lastNameFocus);
                },
              ),

              Padding( padding: EdgeInsets.only(top: 10.0), ),

              TextFormField(
                controller: widget._lastName,
                validator: lastNameValidator,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.greyColor,
                    ),
                  ),
                  labelText: 'last name',
                  labelStyle: AppStyles.getSFUITextLightStyle(),
                ),
                focusNode: _lastNameFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  _lastNameFocus.unfocus();
                  FocusScope.of(context).requestFocus(_bioFocus);
                },
              ),

            ],
          ),
        ),

        Padding(padding: EdgeInsets.only(top: 40.0)),

        iconsGender(widget.profileSetup1Bloc),

        Padding(padding: EdgeInsets.only(top:40.0)),

        //Bio
        Column(
          children: <Widget>[

            Row(
              children: <Widget>[
                Text('your bio: ', style: AppStyles.getSFUITextLight()),
                Text('tell us a bit about you',
                    style: AppStyles.getSFUITextLightStyle2(
                        20.0, AppColors.greyColor20, FontWeight.w300)),
              ],
            ),

            Column(
              children: [

                TextFormField(
                  controller: widget._bio,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.greyColor)),
                    labelText: ' ',
                  ),
                  focusNode: _bioFocus,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (value) {
                    _bioFocus.unfocus();
                  },
                ),

              ],
            ),
          ],
        )

      ],
    );
  }

}
