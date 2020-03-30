import 'package:flutter/material.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/match_making/common/bottom_button.dart';
import 'package:golf/pages/match_making/match_making_interests/interests_bloc.dart';
import 'package:golf/pages/match_making/match_making_interests/interests_list.dart';
import 'package:golf/pages/match_making/match_making_interests/progress_bar_interests.dart';
import 'package:golf/pages/match_making/match_making_your_game/your_game.dart';
import 'package:golf/pages/profile_setup/common/detail_app_bar.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';

class Interests extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {

  final InterestsBloc _interestsBloc = InterestsBloc();

  @override
  Widget build(BuildContext context) {

    return BaseBlocScaffoldWidget(
      _interestsBloc,

      getDetailAppBar(context, 'INTERESTS'),

      Container(
        padding: EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 0.0),
        child: Column(
          children: <Widget>[

            getProgressBarInterests(),

            Padding( padding: EdgeInsets.only(top: 10.0),),

            Text(
                'What are you interested in? Select the industries you prefer to be matched with.',
                style: AppStyles.getSFUITextLightStyle3(
                    16.0, AppColors.darkGrey, 1.6)),

            SizedBox(height: 10.0),

            Text(
                '(select more than one, you can always change them later)',
                style: AppStyles.getSFUITextLightStyle3(
                    14.0, AppColors.darkGrey2, 1.6)),

            Padding( padding: EdgeInsets.only(top: 10.0)),

            Expanded(
              child: StreamBuilder<List<int>>(
                initialData: List(),
                stream: _interestsBloc.interestsList,
                builder: (BuildContext context, AsyncSnapshot snapshot) {

                  return ListView(
                    children: <Widget>[

                       getInterestsList(false),

                    ],

                  ) ;

                },

              ),
            ),

            InkWell(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => YourGame())),
              child: getBottomButton('CONTINUE'),
            )
          ],
        ),

      ),

      backgroundColor: Colors.white,
    );
  }

}


