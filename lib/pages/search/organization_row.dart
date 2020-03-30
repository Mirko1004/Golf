import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class OrganizationRow extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String membersCount;
  final String holesCount;
  final rowHeight = 80.0;

  OrganizationRow(
      this.title, this.imageUrl, this.membersCount, this.holesCount);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Container(
            height: rowHeight,
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: CachedNetworkImageProvider(imageUrl),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                    ),
                    Container(
                      height: 80.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(title,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.getSFUITextMediumStyle(16.0, 0.0,
                                  AppColors.blackColor, FontWeight.w500)),
                          Text('Tampa, FL',
                              style: AppStyles.getRobotoLightStyle2()),
                          SizedBox(height: 2.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Image.asset("assets/images/countr_club_star.png",
                                  width: 13.0, height: 13.0),
                              Padding(
                                padding: EdgeInsets.only(right: 5.0),
                              ),
                              Text(membersCount,
                                  style: AppStyles.getRobotoLightStyle2()),
                              Padding(
                                padding: EdgeInsets.only(right: 15.0),
                              ),
                              Image.asset(
                                  "assets/images/country_club_holes.png",
                                  width: 13.0,
                                  height: 13.0),
                              Padding(
                                padding: EdgeInsets.only(right: 5.0),
                              ),
                              Text(holesCount,
                                  style: AppStyles.getRobotoLightStyle2()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

    );
  }
}
