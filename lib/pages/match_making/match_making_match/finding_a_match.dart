import 'package:flutter/material.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/match_making/common/bottom_button.dart';
import 'package:golf/pages/match_making/match_making_interests/interests_bloc.dart';
import 'package:golf/pages/match_making/match_making_match/age_groups.dart';
import 'package:golf/pages/match_making/match_making_match/progress_bar_fam.dart';
import 'package:golf/pages/match_making/match_making_match/select_gender.dart';
import 'package:golf/pages/match_making/match_making_match/skills.dart';
import 'package:golf/pages/profile_setup/common/detail_app_bar.dart';
import 'package:golf/utils/app_styles.dart';

class FindingAMatch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FindingAMatchState();
}

class _FindingAMatchState extends State<FindingAMatch> {

  final InterestsBloc _findingAMatchBloc = InterestsBloc();

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

      _findingAMatchBloc,

      getDetailAppBar(context, 'FINDING A MATCH'),

      Container(
        padding: EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

             getProgressBarFAM(),

            Text('Connect with like - minds. Interact and play',
                  style: AppStyles.getSFUITextLight2()),

            Padding( padding: EdgeInsets.only(top: 10.0)),

            Expanded(
              child: StreamBuilder<List<int>>(
                initialData: List(),
                stream: _findingAMatchBloc.interestsList,
                builder: (BuildContext context, AsyncSnapshot snapshot) {

                  return  ListView(
                      children: <Widget>[

                       getColumnFAM(),

                        getSelectGender(),

                        getAgeGroups(),

                      ],

                    );
                  },
              ),
            ),


             InkWell(
                onTap: () => Navigator.popUntil(context, ModalRoute.withName('/home')),
                child: getBottomButton('DONE'),
              ),

          ],
        ),

      ),

      backgroundColor: Colors.white,
    );
  }

}


