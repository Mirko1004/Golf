import 'package:flutter/material.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/match_making/match_making_interests/interests_bloc.dart';
import 'package:golf/pages/play/play_golf/hunters_green/players_row.dart';
import 'package:golf/pages/play/play_golf/hunters_green/skins_game.dart';
import 'package:golf/pages/profile_setup/common/detail_app_bar.dart';
import 'package:golf/utils/app_styles.dart';

class HuntersGreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HuntersGreenState();
}

class _HuntersGreenState extends State<HuntersGreen> {

  final InterestsBloc _huntersGreenBloc = InterestsBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BaseBlocScaffoldWidget(

      _huntersGreenBloc,

      getDetailAppBar(context, "HUNTER'S GREEN"),

      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            getSkinsGame(),

            Padding(
              padding: const EdgeInsets.only(left:15.0,right:15.0),
              child: Text('Enter scores for each player and swipe for next hole.',
                  style: AppStyles.getSFUITextLight2()),
            ),

            Expanded(
              child: StreamBuilder<List<int>>(
                initialData: List(),
                stream: _huntersGreenBloc.interestsList,
                builder: (BuildContext context, AsyncSnapshot snapshot) {

                  return  ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[

                          SizedBox(height: 20.0),

                          getPlayersRow(),

                        ],

                      ),

                    ],

                  );

                },

              ),
            ),

            getGpsRow(),

          ],
        ),

      ),

      backgroundColor: Colors.white,
    );
  }
}

getGpsRow(){
  Widget column( String text) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: <Widget>[

          CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.grey,
          ),

          SizedBox(height: 8.0),

          Text(text,
              style: AppStyles.getSFUITextRegularStyle(16.0, 0.0, Colors.black, FontWeight.w400)),

        ],
      ),
    );
  }

  return Row(
    children: <Widget>[
      Column( children: <Widget> [ column('gps')]),
      Column( children: <Widget> [ column('scorecard')]),
      Column( children: <Widget> [ column('next round')],

      )
    ],

  );

}
