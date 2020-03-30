import 'package:flutter/material.dart';
import 'package:golf/pages/play/play_golf/play_golf.dart';
import 'package:golf/utils/app_styles.dart';

class PlaySportsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(10.0),

      child: Column(
        children: <Widget>[

          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/golf_image.png",
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),

              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.9),
                  ],
                )),

                child: Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, top: 60.0, right: 25.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text('golf',
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.getSFUITextLight5()),

                          SizedBox(height: 5.0),

                          Text('5 games',
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.getSFUITextLight4()),

                          Text('Multiple player',
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.getSFUITextLight4()),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              Expanded(
                                child: Text('Score card',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.getSFUITextLight4()),
                              ),

                              InkWell(
                                onTap: () => Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) => PlayGolf())),
                                child: Container(
                                  width: 79.0,

                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[

                                      Text('PLAY',
                                          style: AppStyles.getSurannaStyle2(
                                              22.0, 1.52, Colors.white, 1.1)),

                                      Padding(
                                          padding: EdgeInsets.only(bottom: 5.0),
                                          child: Image.asset(
                                              'assets/images/play_next.png')),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),

                          SizedBox(height: 10.0),

                        ])),
              )),

          SizedBox(height: 13.0),

          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/tennis_image.png",
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),

              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.9),
                  ],
                )),

                child: Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, top: 110.0, right: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text('tennis',
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.getSFUITextLight5()),

                        SizedBox(height: 5.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Expanded(

                              child: Text('coming soon...',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyles.getSFUITextLight4()),
                            ),

                            Container(
                              width: 79.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                                  Text('PLAY',
                                      style: AppStyles.getSurannaStyle2(
                                          22.0, 1.52, Colors.white, 1.1)),

                                  Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Image.asset(
                                          'assets/images/play_next.png')),

                                ],
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 10.0),

                      ],
                    )),
              )),

          SizedBox(height: 13.0),

          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/swimming_image.png",
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),

              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.8),
                  ],
                )),

                child: Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, top: 110.0, right: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text('swimming',
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.getSFUITextLight5()),

                        SizedBox(height: 5.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Expanded(
                              child: Text('coming soon...',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyles.getSFUITextLight4()),
                            ),

                            Container(
                              width: 79.0,

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                                  Text('PLAY',
                                      style: AppStyles.getSurannaStyle2(
                                          22.0, 1.52, Colors.white, 1.1)),

                                  Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Image.asset(
                                          'assets/images/play_next.png')),

                                ],
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 10.0),
                      ],
                    )),
              )),

          SizedBox(height: 13.0),

          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/fitness_image.png",
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),

              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.8),
                  ],
                )),

                child: Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, top: 110.0, right: 25.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('fitness',
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.getSFUITextLight5()),

                        SizedBox(height: 5.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Expanded(
                              child: Text('coming soon...',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyles.getSFUITextLight4()),
                            ),

                            Container(
                              width: 79.0,

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                                  Text('PLAY',
                                      style: AppStyles.getSurannaStyle2(
                                          22.0, 1.52, Colors.white, 1.1)),

                                  Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Image.asset(
                                          'assets/images/play_next.png')),
                                ],
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 10.0),

                      ],
                    )),
              )),

          SizedBox(height: 15.0),

        ],
      ),
    );
  }
}
