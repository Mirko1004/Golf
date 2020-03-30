import 'package:flutter/material.dart';
import 'package:golf/pages/profile/profile_bloc.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getPostsFollowersRow(ProfileBloc _profileBloc) {

  return Padding(
    padding: EdgeInsets.only(left: 20.0,top:5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[

            Text(_profileBloc.session.profileViewLong.cnt_timeline_event_posts,
                style: TextStyle(
                    fontFamily: 'SFUIText-Light',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.6,
                    color: Colors.black)),
            Text('posts',
                style: AppStyles.getDemiDannyStyle(
                    12.0, AppColors.greyColor11, FontWeight.w500, 1.3)),
          ],
        ),

        Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Container(
            width: 1.0,
            height: 50.0,
            color: AppColors.greyColor10,
          ),
        ),

        Column(
          children: <Widget>[
            Text(_profileBloc.session.profileViewLong.cnt_followers,
                style: TextStyle(
                    fontFamily: 'SFUIText-Light',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.6,
                    color: Colors.black)),
            Text('followers',
                style: AppStyles.getDemiDannyStyle(
                    12.0, AppColors.greyColor11, FontWeight.w500, 1.3)),
          ],
        ),

        Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Container(
            width: 1.0,
            height: 50.0,
            color: AppColors.greyColor10,
          ),
        ),

        Column(
          children: <Widget>[
            Text(_profileBloc.session.profileViewLong.cnt_friends,
                style: TextStyle(
                    fontFamily: 'SFUIText-Light',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.6,
                    color: Colors.black)),
            Text('friends',
                style: AppStyles.getDemiDannyStyle(
                    12.0, AppColors.greyColor11, FontWeight.w500, 1.3)),
          ],
        ),

        Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Container(
            width: 1.0,
            height: 50.0,
            color: AppColors.greyColor10,
          ),
        ),

        Column(
          children: <Widget>[
            Text(_profileBloc.session.profileViewLong.cnt_following,
                style: TextStyle(
                    fontFamily: 'SFUIText-Light',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.6,
                    color: Colors.black)),
            Text('following',
                style: AppStyles.getDemiDannyStyle(
                    12.0, AppColors.greyColor11, FontWeight.w500, 1.3)),
          ],
        ),

        SizedBox(width: 25.0),

      ],
    ),
  );
}
