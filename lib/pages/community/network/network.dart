import 'package:golf/pages/community/network/network_image.dart'
    as prefix0;
import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class Network extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.only(top: 8.0),

          child: Column(
            children: <Widget>[

              prefix0.NetworkImage(),

              SizedBox(height: 15.0),

              Center(
                  child: Column(
                children: <Widget>[

                  Text('We match you with the right people you ',
                      style: AppStyles.getSFUITextLightStyle2(
                          16.0, AppColors.greyColor21, FontWeight.w300)),

                  SizedBox(height: 5.0),

                  Text('can build a network with.',
                      style: AppStyles.getSFUITextLightStyle2(
                          16.0, AppColors.greyColor21, FontWeight.w300)),
                ],
              )),

            ],
          ),
        ),
      ),
    );
  }
}
