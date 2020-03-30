import 'package:flutter/material.dart';
import 'package:golf/base/base_bloc_widget.dart';
import 'package:golf/pages/profile/posts_followers_row.dart';
import 'package:golf/pages/profile/profile_bloc.dart';
import 'package:golf/pages/profile/profile_completeness.dart';
import 'package:golf/pages/profile/profile_listview.dart';
import 'package:golf/pages/profile/profile_row.dart';
import 'package:golf/utils/app_colors.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ProfileBloc _profileBloc = ProfileBloc();

  @override
  Widget build(BuildContext context) {
    return BaseBlocWidget(

        _profileBloc,

        Container(
          color: Colors.white,

          child: SingleChildScrollView(

            child: Column(
              children: <Widget>[

                Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),

                    child: Column(
                      children: <Widget>[

                        Padding(
                          padding: EdgeInsets.only(top: 16.0),
                        ),

                        getProfileRow(_profileBloc, false),

                        Padding(
                          padding: EdgeInsets.only(top: 16.0),
                        ),

                        Container(
                          height: 1.0,
                          width: 363.0,
                          color: AppColors.greyColor10,
                        ),

                        getPostsFollowersRow(_profileBloc),

                        getProfileCompleteness(),

                      ],
                    )),

                profileListView(_profileBloc,_profileBloc),

              ],
            ),
          ),
        ));
  }
}
