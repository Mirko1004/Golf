import 'package:flutter/material.dart';
import 'package:golf/pages/match_making/match_making_interests/interests.dart';
import 'package:golf/utils/app_Box_Decoration.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class MatchMaking extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        child: Stack(
          children: <Widget>[

            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background_mm.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            AppBar(
              titleSpacing: 0.0,
              backgroundColor: Colors.transparent,
              title: Text(
                'MATCH - MAKING',
                style: AppStyles.getSurannaStyle(24.0, 0.0, Colors.white),
              ),
              leading: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Image.asset('assets/images/back_network.png')),
            ),

            Positioned.fill(
              top: 270.0,

              child: Align(
                alignment: Alignment.center,

                child: Text(
                  'CONNECT. INTERACT ',
                  style: AppStyles.getSurannaStyle(
                      28.0, 1.0, AppColors.orangeColor),
                ),
              ),
            ),

            Positioned.fill(
                top: 340.0,

                child: Align(
                  alignment: Alignment.center,

                  child: Text(
                    '& PLAY',
                    style: AppStyles.getSurannaStyle(
                        28.0, 1.0, AppColors.orangeColor),
                  ),
                )),

            Positioned.fill(
                top: 410.0,

                child: Align(
                  alignment: Alignment.center,

                  child: Text('at the intersection of sport and life.',
                      style: AppStyles.getSFUITextLightStyle2(
                          18.0, Colors.white, FontWeight.w300)),
                )),

            Positioned(
              top: 610.0,
              right: 30.0,
              left: 45.0,

              child: InkWell(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Interests())),

                child: Container(
                    width: 327.0,
                    height: 40,
                    decoration: AppDecoration.bottomBoxNetwork,

                    child: Center(

                        child: Text('GET STARTED',
                            style: AppStyles.getSurannaStyle2(
                                20.0, 1.38, Colors.white, 2.0)))),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
