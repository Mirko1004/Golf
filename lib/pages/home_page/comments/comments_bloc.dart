import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/repository/network/model/get_comments_response.dart';
import 'package:rxdart/rxdart.dart';

class CommentsBloc extends BaseBloc {

  final String _postId;
  final String _contentSystem;
  final BehaviorSubject<List<Comment>> comments = BehaviorSubject<List<Comment>>.seeded(List());
  final BehaviorSubject<bool> loadMoreComments = BehaviorSubject.seeded(false);
  final int commentsPerPage = 24;

  CommentsBloc(this._postId, this._contentSystem){
    getComments(false);
  }

  @override
  void dispose() {
    comments.close();
    loadMoreComments.close();
    super.dispose();
  }

  getComments(bool loadMore) async {
    int start = 0;
    if(loadMore){
      start = comments.value.length;
    } else {
      loadMoreComments.value = false;
//      comments.value = List();
    }

    httpDataClientInterface.getComments(_postId, _contentSystem, start, commentsPerPage).then((commentsResponse){
      loadMoreComments.value = commentsResponse.loadMore;
      if(loadMore)
        comments.value = comments.value..addAll(commentsResponse.comments);
      else
        comments.value = commentsResponse.comments;
    }).catchError((err){
      showError(err.toString());
    });
  }

  postComment(String commentText, String parentCommentId) {
    showProgress(true);
    httpDataClientInterface.postComment( _postId, _contentSystem, parentCommentId, commentText ).then((success){
      showProgress(false);
      getComments(false);
      dataCache.getTimelinePosts(false);
    }).catchError((err){
      showProgress(false);
      showError(err.toString());
    });
  }

  voteComment(String commentUniqueId, String parentCommentId) {
    bool love;
    Comment comment;
    if(parentCommentId == "0") {
      comment = comments.value.firstWhere((comment) => comment.cmtUniqueId == commentUniqueId);
    }
    else {
      comment = comments.value.firstWhere((comment) => comment.cmtUniqueId == parentCommentId).replies.firstWhere((comment) => comment.cmtUniqueId == commentUniqueId);
    }

    love = !comment.voteData.performedByLoggedUser;

    httpDataClientInterface.vote(commentUniqueId, love, "sys_cmts").then((voteResponse){
      comment.voteData.performedByLoggedUser = love;
      comments.value = comments.value;
    }).catchError((err){
      showError(err.toString());
    });
  }
}