import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class ProfilesRow extends StatelessWidget {

  final bool _fromDrawer;
  final String profileId;
  final String name;
  final String imageUrl;
  final List<String> interests;

  ProfilesRow( this._fromDrawer, this.profileId, this.name, this.imageUrl, this.interests );

  @override
  Widget build(BuildContext context) {

    String sports = interests.map((interest) =>  "#$interest" ).toList().join(" ");

    double avatarRadius = 25.0;
    double rowHeight = 80.0;
    double paddingTop = 8.0;

    if(_fromDrawer){
      avatarRadius = 25.0;
      rowHeight = 60.0;
      paddingTop = 2.0;
    }

    return InkWell(
      onTap: null,
      child: Container(
        height: rowHeight,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            CircleAvatar(
              radius: avatarRadius,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(imageUrl),
            ),

            Padding( padding: EdgeInsets.only(left: 15.0) , ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text( name,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.getSFUITextMediumStyle(16.0, 0.0, AppColors.blackColor, FontWeight.w500)
                  ),

                  Padding(padding: EdgeInsets.only(top: paddingTop),),

                  Text( sports,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.getRobotoLightStyle2()
                  ),

                  Padding(padding: EdgeInsets.only(top: paddingTop),),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}