import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:flutter_section_table_view/pullrefresh/src/smart_refresher.dart';
import 'package:golf/base/base_bloc_widget.dart';
import 'package:golf/pages/common_widgets/table_view_refresh_widgets.dart';
import 'package:golf/pages/home_page/likes/likes_person_row.dart';
import 'package:golf/repository/network/model/get_vote_persons.dart';

import 'likes_bloc.dart';

class Likes extends StatefulWidget {
  final String _contentVoteId;
  final String _contentVoteSystem;

  Likes(this._contentVoteId, this._contentVoteSystem);

  @override
  State<StatefulWidget> createState() => _LikesState(_contentVoteId, _contentVoteSystem);
}

class _LikesState extends State<Likes> {
  final LikesBloc _likesBloc;
  RefreshController _refreshController;

  _LikesState(String postId, String contentSystem) : _likesBloc = LikesBloc(postId, contentSystem);

  @override
  Widget build(BuildContext context) {

    return BaseBlocWidget(

      _likesBloc,

      Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[

            StreamBuilder<List<VotePerson>>(
              stream: _likesBloc.profiles,
              initialData: List(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {

                _refreshController = RefreshController();

                return Expanded(
                  child: SectionTableView(
                    numOfRowInSection: (int section) => snapshot.data.length,
                    sectionCount: 1,
                    cellAtIndexPath: (int section, int row) => LikesPersonRow(snapshot.data[row], _likesBloc),
                    refreshController: _refreshController,
                    enablePullDown: true,
                    enablePullUp: _likesBloc.loadMoreProfiles.value,
                    refreshHeaderBuilder: getRefreshHeaderWidget,
                    onRefresh: (up) => _refreshProfiles(up),
                  ),
                );

              },
            ),

          ],
        ),
      ),

    );

  }

  _refreshProfiles(bool up) async {
    if(up){
      await _likesBloc.getVotePersons(false);
    } else
      await _likesBloc.getVotePersons(true);

    _refreshController.sendBack(up, RefreshStatus.completed);
  }
}
