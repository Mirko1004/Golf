import 'package:flutter/material.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/match_making/common/bottom_button.dart';
import 'package:golf/pages/match_making/match_making_interests/interests_bloc.dart';
import 'package:golf/pages/match_making/match_making_match/finding_a_match.dart';
import 'package:golf/pages/match_making/match_making_your_game/betting.dart';
import 'package:golf/pages/match_making/match_making_your_game/golfing_round.dart';
import 'package:golf/pages/match_making/match_making_your_game/how_fast.dart';
import 'package:golf/pages/match_making/match_making_your_game/progress_bar_your_game.dart';
import 'package:golf/pages/profile_setup/common/detail_app_bar.dart';
import 'package:golf/utils/app_styles.dart';

class YourGame extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _YourGameState();
}

class _YourGameState extends State<YourGame> {

  final InterestsBloc _yourGameBloc = InterestsBloc();

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

      _yourGameBloc,

      getDetailAppBar(context, 'YOUR GAME'),

      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 0.0),
              child:  getProgressBarYourGame(),

            ),

            Padding(
              padding: EdgeInsets.fromLTRB(18.0,10.0,18.0,0.0),
              child: Text("Let's talk about your game!",
                  style: AppStyles.getSFUITextLight2()),
            ),

            Padding( padding: EdgeInsets.only(top: 10.0),),

            Expanded(
              child: StreamBuilder<List<int>>(
                initialData: List(),
                stream: _yourGameBloc.interestsList,
                builder: (BuildContext context, AsyncSnapshot snapshot) {

                  return Padding(
                    padding:EdgeInsets.only(left:18.0),
                    child: ListView(
                      children: <Widget>[

                        getHowFast(),

                        getGolfingRound(),

                        getBetting(),

                      ],

                    ),
                  ) ;

                },

              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(18.0,10.0,18.0,0.0),

              child: InkWell(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FindingAMatch())),
                child: getBottomButton('CONTINUE'),
              ),

            )
          ],
        ),

      ),

      backgroundColor: Colors.white,
    );
  }


}


