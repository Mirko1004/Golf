import 'package:flutter/material.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';
import 'add_player_row.dart';


class AddPlayers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('ADD PLAYER',
              style:
                  AppStyles.getSurannaStyle(24.0, 0.0, AppColors.blackColor)),
          leading: Image(
            image: AssetImage('assets/images/back_arrow.png'),
          )),
      body: Container(
        height: 600.0,
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('BUDDIES       ',
                      style: AppStyles.getSFUITextMediumStyle(
                          16.0, 0.0, AppColors.blackColor, FontWeight.w500)),
                  Text(' CONTACTS ',
                      style: AppStyles.getSFUITextMediumStyle(
                          16.0, 0.0, AppColors.lightBlack, FontWeight.w500)),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 300.0, top: 11.0, bottom: 20.0),
                child: Container(
                  width: 71.0,
                  height: 1.0,
                  decoration: BoxDecoration(
                    color: AppColors.greenColor,
                    border: Border.all(color: AppColors.greenColor),
                    borderRadius: BorderRadius.all(Radius.elliptical(60, 45)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Container(
                  width: 379.0,
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
                  child: Card(
                      child: ListTile(
                          contentPadding:
                              EdgeInsets.only(left: 20.0, right: 20.0),
                          title: Text('send email invitations',
                              textAlign: TextAlign.justify,
                              style: AppStyles.getSFUITextLight()),
                          trailing: Image.asset('assets/images/@.png'))),
                ),
              ),
              addPlayerRow(),
            ],
          ),
        ),
      ),
    );
  }
}
