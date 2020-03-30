import 'package:flutter/material.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/match_making/common/bottom_button.dart';
import 'package:golf/pages/match_making/match_making_interests/interests_bloc.dart';
import 'package:golf/pages/play/play_golf/hunters_green/hunters_green.dart';
import 'package:golf/pages/play/play_golf/round_setup/confirm_round_setup/round_setup_list.dart';
import 'package:golf/pages/play/play_golf/round_setup/tee_box.dart';
import 'package:golf/pages/profile_setup/common/detail_app_bar.dart';
import 'package:golf/utils/app_colors.dart';

class ConfirmRoundSetup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConfirmRoundSetupState();
}

class _ConfirmRoundSetupState extends State<ConfirmRoundSetup> {

  final InterestsBloc _confirmRoundSetupBloc = InterestsBloc();

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

      _confirmRoundSetupBloc,

      getDetailAppBar(context, 'CONFIRM ROUND SETUP'),

      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Expanded(
              child: StreamBuilder<List<int>>(
                initialData: List(),
                stream: _confirmRoundSetupBloc.interestsList,
                builder: (BuildContext context, AsyncSnapshot snapshot) {

                  return  ListView(
                      children: <Widget>[

                        getRoundSetupList(),

                       Container(
                         height: 1.0,
                         color: AppColors.greyColor9,
                       ),

                        Padding(
                         padding: EdgeInsets.only(left:18.0),
                         child: getTeeBox(),
                        ),

                        SizedBox(height: 15.0),

                      ],

                    );

                  },

              ),
            ),


            Padding(
              padding: EdgeInsets.fromLTRB(18.0,10.0,18.0,0.0),
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HuntersGreen())),
                child: getBottomButton('CONFIRM SETUP'),
              ),
            )
          ],
        ),

      ),

      backgroundColor: Colors.white,
    );
  }

}


