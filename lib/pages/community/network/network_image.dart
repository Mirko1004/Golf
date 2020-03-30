import 'package:flutter/material.dart';
import 'package:golf/pages/match_making/match_making_homepage/match_making.dart';
import 'package:golf/utils/app_Box_Decoration.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class NetworkImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/network_image.png",
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.5),
                ],
              )),
          child: Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Column(
                children: <Widget>[
                  Text('WELCOME TO ',
                      style: AppStyles.getSurannaStyle(
                          16.0, 0.89, AppColors.orangeColor)),
                  Text('YOUR COMMUNITY',
                      style: AppStyles.getSurannaStyle2(
                          24.0, 1.33, AppColors.orangeColor, 1.2)),
                  SizedBox(height: 14.0),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => MatchMaking())),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 327.0,
                          height: 40,
                          decoration: AppDecoration.bottomBoxNetwork,
                          child: Center(
                              child: Text('FIND A MATCH',
                                  style: AppStyles.getSurannaStyle2(
                                      24.0, 1.38, Colors.white, 1.7)))),
                    ),
                  ),
                  SizedBox(height: 10.0),
                ],
              )),
        ));
  }
}
