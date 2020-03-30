import 'package:flutter/material.dart';
import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getProfileRow(BaseBloc baseBloc, bool fromDrawer) {

  double avatarRadius = 35.0;
  if(fromDrawer) {
    avatarRadius = 30.0;
  }

  return Row(
    children: <Widget>[

      if(fromDrawer) ... [
        Padding( padding: EdgeInsets.only(left: 10.0), ),
      ],

      CircleAvatar(
        radius: avatarRadius,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(baseBloc.session.profileViewLong.profile_picture_url),
      ),

      Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(baseBloc.session.profileViewLong.profile_title,
                style: AppStyles.getDemiDannyStyle(
                    16.0, Colors.black, FontWeight.w500, 1.5)),
            Text(baseBloc.session.profileViewLong.userOrganizations != null ? baseBloc.session.profileViewLong.userOrganizations.first.orgName : "",
                style: AppStyles.getSFUITextRegularStyle(
                    14.0, 0.0, Colors.black, FontWeight.w400)),

            SizedBox(height: 13.0),

            InkWell(
              onTap: null,

              child: Container(
                  height: 26.0,
                  width: 161.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: AppColors.orangeColor, width: 1.0),
                    borderRadius: BorderRadius.horizontal(),
                  ),

                  child: Center(

                      child: Text(
                    'edit profile',
                    style: AppStyles.getSFUITextMediumStyle(
                        14.0, 0.0, AppColors.greenColor, FontWeight.w500),
                  ))),
            )
          ],
        ),
      ),
    ],
  );
}
