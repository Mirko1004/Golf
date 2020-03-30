import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:flutter_section_table_view/pullrefresh/src/smart_refresher.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/common_widgets/table_view_refresh_widgets.dart';
import 'package:golf/pages/home_page/comments/comment_row_new.dart';
import 'package:golf/pages/home_page/comments/comment_text_input_widget.dart';
import 'package:golf/pages/profile_setup/common/detail_app_bar.dart';
import 'package:golf/repository/network/model/get_comments_response.dart';

import 'comments_bloc.dart';

class Comments extends StatefulWidget {
  final String _postId;
  final String _contentSystem;

  Comments(this._postId, this._contentSystem);

  @override
  State<StatefulWidget> createState() =>
      _CommentsState(_postId, _contentSystem);
}

class _CommentsState extends State<Comments> {
  final CommentsBloc _commentsBloc;
  RefreshController _refreshController;

  _CommentsState(String postId, String contentSystem)
      : _commentsBloc = CommentsBloc(postId, contentSystem);

  @override
  Widget build(BuildContext context) {
    return BaseBlocScaffoldWidget(

        _commentsBloc,

        getDetailAppBar(context, 'COMMENTS'),

        Column(
          children: <Widget>[
            StreamBuilder<List<Comment>>(
              stream: _commentsBloc.comments,
              initialData: List(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {

                _refreshController = RefreshController();

                return Expanded(
                  child: SectionTableView(
                    numOfRowInSection: (int section) => snapshot.data.length,
                    sectionCount: 1,
                    cellAtIndexPath: (int section, int row) => CommentRowNew(
                        snapshot.data[row],
                        _commentsBloc.voteComment,
                        _commentsBloc.postComment),

                    refreshController: _refreshController,
                    enablePullDown: true,
                    enablePullUp: _commentsBloc.loadMoreComments.value,
                    refreshHeaderBuilder: getRefreshHeaderWidget,
                    onRefresh: (up) => _refreshMessages(up),
                  ),
                );
              },
            ),

            CommentTextInputWidget(_commentsBloc.postComment, "0"),

          ],
        ));
  }

  _refreshMessages(bool up) async {
    if (up) {
      await _commentsBloc.getComments(false);
    } else
      await _commentsBloc.getComments(true);

    _refreshController.sendBack(up, RefreshStatus.completed);
  }
}
