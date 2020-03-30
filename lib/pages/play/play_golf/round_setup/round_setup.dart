import 'package:flutter/material.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/match_making/common/bottom_button.dart';
import 'package:golf/pages/match_making/match_making_interests/interests_bloc.dart';
import 'package:golf/pages/play/play_golf/round_setup/add_second_player.dart';
import 'package:golf/pages/play/play_golf/round_setup/confirm_round_setup/confirm_round_setup.dart';
import 'package:golf/pages/play/play_golf/round_setup/round_type.dart';
import 'package:golf/pages/play/play_golf/round_setup/skins_unit.dart';
import 'package:golf/pages/play/play_golf/round_setup/starting_hole.dart';
import 'package:golf/pages/play/play_golf/round_setup/tee_box.dart';
import 'package:golf/pages/profile_setup/common/detail_app_bar.dart';
import 'package:golf/utils/app_styles.dart';

class RoundSetup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RoundSetupState();
}

class _RoundSetupState extends State<RoundSetup> {


  final InterestsBloc _roundSetupBloc = InterestsBloc();

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

      _roundSetupBloc,

      getDetailAppBar(context, 'ROUND SETUP'),

      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Expanded(
              child: StreamBuilder<List<int>>(
                initialData: List(),
                stream: _roundSetupBloc.interestsList,
                builder: (BuildContext context, AsyncSnapshot snapshot) {

                  return Padding(
                    padding:EdgeInsets.only(left:18.0,top:10.0),
                    child: ListView(
                      children: <Widget>[

                        getRoundType(),

                        getStartingHole(),

                        getTeeBox(),

                        SizedBox(height: 20.0),

                        Text('distance', style: AppStyles.getSFUITextLight()),

                        SizedBox(height: 10.0),

                        Text('Default measurement is in Yards. Toogle of if Meters is preferred',
                            style: AppStyles.getSFUITextLight2()),

                        SizedBox(height: 20.0),

                        Row(
                          children: <Widget>[
                            Text('yards',
                                style: AppStyles.getSFUITextMediumStyle(20.0,
                                    0.0, Colors.black, FontWeight.w500)),
                          ],
                        ),

                        getAddSecondPlayer(context),

                        getSkinsUnit(),

                        SizedBox(height: 40.0),

                        Text('scoring', style: AppStyles.getSFUITextLight()),

                        SizedBox(height: 10.0),

                        Text('Use the app to keep scores. Turn off this feature to use paper scorecard if preferred.',
                            style: AppStyles.getSFUITextLight2()),

                        SizedBox(height: 20.0),

                        Row(
                          children: <Widget>[
                            Text('live scoring',
                                style: AppStyles.getSFUITextMediumStyle(20.0,
                                    0.0, Colors.black, FontWeight.w500)),
                          ],
                        ),

                        SizedBox(height: 15.0),

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
                    MaterialPageRoute(builder: (context) => ConfirmRoundSetup())),
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


