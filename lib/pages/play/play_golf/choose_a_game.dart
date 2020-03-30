import 'package:flutter/material.dart';
import 'package:golf/pages/play/play_golf/round_setup/round_setup.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

getChooseAGame(BuildContext context) {

  return Padding(
    padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text(
          'choose a game',
          style: AppStyles.getSFUITextLightStyle2(
              20.0, AppColors.lightBlack4, FontWeight.w300),
        ),

        SizedBox(height: 20.0),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Card(

                child: Padding(
              padding: const EdgeInsets.all(15.0),

              child: Row(children: <Widget>[

                Container(
                  height: 129.0,
                  width: 1.0,
                  color: AppColors.orangeColor,
                ),

                Padding(
                  padding: EdgeInsets.all(15.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                          width: 100.0,
                          child: Text('individual game',
                              style: AppStyles.getSFUITextLightStyle2(
                                  18.0, Colors.black, FontWeight.w300))),

                      SizedBox(height: 20.0),

                      Text('see rules',
                          style: AppStyles.getSFUITextLightStyle2(
                              16.0, AppColors.lightBlack4, FontWeight.w300)),

                      SizedBox(height: 30.0),

                      InkWell(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => RoundSetup())),
                        child: Row(
                          children: <Widget>[

                            Text(
                              'PLAY',
                              style: AppStyles.getSFUITextMediumStyle(16.0, 0.0,
                                  AppColors.greenColor, FontWeight.w500),
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                )
              ]),
            )),

            Card(

                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(children: <Widget>[

                Container(
                  height: 129.0,
                  width: 1.0,
                  color: AppColors.orangeColor,
                ),

                Padding(
                  padding: EdgeInsets.all(15.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                          width: 100.0,
                          child: Text('18TH&MAIN skins',
                              style: AppStyles.getSFUITextLightStyle2(
                                  18.0, Colors.black, FontWeight.w300))),

                      SizedBox(height: 20.0),

                      Text('see rules',
                          style: AppStyles.getSFUITextLightStyle2(
                              16.0, AppColors.lightBlack4, FontWeight.w300)),

                      SizedBox(height: 30.0),

                      InkWell(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => RoundSetup())),
                        child: Row(
                          children: <Widget>[

                            Text(
                              'PLAY',
                              style: AppStyles.getSFUITextMediumStyle(16.0, 0.0,
                                  AppColors.greenColor, FontWeight.w500),
                            )

                          ],
                        ),
                      )

                    ],
                  ),
                )
              ]),
            )),
          ],
        ),
      ],
    ),
  );
}
