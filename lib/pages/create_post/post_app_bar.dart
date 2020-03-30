import 'package:flutter/material.dart';
import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getPostAppBar( BuildContext context, BaseBloc baseBloc, String title, Function onBack) {

  return PreferredSize(
    preferredSize: Size.fromHeight(70.0),
    child: SafeArea(
      child: Row(
        children: <Widget>[

          Padding( padding: EdgeInsets.only(left: 20.0),),

          CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage(baseBloc.session.profileViewLong.profile_picture_url),
          ),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(title, style: AppStyles.getSurannaStyle(24.0, 0.0, AppColors.blackColor)),
              ],
            ),
          ),

          InkWell(
            onTap: () => onBack(),
            child: Image.asset(
              "assets/images/exit.png",
              height: 23.0,
              width: 23.0,
            ),
          ),

          Padding( padding: EdgeInsets.only(left: 20.0),),

        ],
      ),
    ),
  );
}
