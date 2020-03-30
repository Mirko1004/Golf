import 'package:flutter/material.dart';
import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/pages/profile/profile_bloc.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

profileListView(ProfileBloc _profileBloc, BaseBloc baseBloc) {

  return Padding(
    padding: EdgeInsets.only(top: 18.0),

    child: Column(
      children: <Widget>[

        Container(
          width: 375.0,
          height: 63.0,
          decoration: BoxDecoration(
            boxShadow: [

              BoxShadow(
                  color: AppColors.lightBlack3,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 0.0)
            ],
          ),

          child: InkWell(
            onTap: null,

            child: Card(

                child: ListTile(
              contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
              title: Text('interest and preferences',
                  style: AppStyles.getSFUITextLight()),
                  trailing: Image.asset('assets/images/right_arrow6.png'),
            )),
          ),
        ),

        Container(
          width: 375.0,
          height: 63.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColors.lightBlack3,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 0.0)
            ],
          ),

          child: InkWell(
            onTap: null,
            child: Card(
                child: ListTile(
              contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
              title: Row(
                children: <Widget>[
                  Expanded(child: Text('country club', style: AppStyles.getSFUITextLight())),

                   Container(
                     width: 100.0,
                     child: Text(baseBloc.session.profileViewLong.userOrganizations != null ? baseBloc.session.profileViewLong.userOrganizations.first.orgName : "",
                        overflow:TextOverflow.ellipsis,style: AppStyles.getSFUITextMediumStyle(18.0, 0.0, AppColors.blackColor4, FontWeight.w500)),
                   ),

                 
                ],
              ),
                  trailing: Image.asset('assets/images/right_arrow6.png'),
            )),
          ),
        ),

        Container(
          width: 375.0,
          height: 63.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColors.lightBlack3,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 0.0)
            ],
          ),

          child: InkWell(
            onTap: null,
            child: Card(
                child: ListTile(
              contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
              title: Text('settings', style: AppStyles.getSFUITextLight()),
                  trailing: Image.asset('assets/images/right_arrow6.png'),
            )),
          ),
        ),

        Container(
          width: 375.0,
          height: 63.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColors.lightBlack3,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 0.0)
            ],
          ),

          child: InkWell(
            onTap: () => _profileBloc.session.logout(),

            child: Card(
                child: ListTile(
              contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
              title: Text('log out', style: AppStyles.getSFUITextLight()),
                  trailing: Image.asset('assets/images/right_arrow6.png'),
            )),
          ),

        ),
      ],
    ),
  );
}
