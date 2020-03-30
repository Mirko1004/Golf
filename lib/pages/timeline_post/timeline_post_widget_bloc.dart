import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/pages/home_page/post_row/post_row_view_model.dart';
import 'package:golf/repository/network/model/get_timeline_posts_response.dart';
import 'package:rxdart/rxdart.dart';

class TimelinePostBloc extends BaseBloc {

  final BehaviorSubject<PostRowViewModel> timelinePost;
  final BehaviorSubject<bool> done = BehaviorSubject.seeded(false);

  TimelinePostBloc(PostRowViewModel timelinePost) : timelinePost  = BehaviorSubject<PostRowViewModel>.seeded(timelinePost);


  @override
  void dispose() {
    done.close();
    super.dispose();
  }

  vote(String postId) {
    TimelinePost timelinePost = dataCache.timelinePosts.value.firstWhere((post) => post.id == postId);
    bool love = timelinePost.reactions.performedByLoggedUser.isEmpty;

    httpDataClientInterface.vote(timelinePost.id, love, timelinePost.contentVoteSystem).then((voteResponse){
      timelinePost.reactions.performedByLoggedUser = love ? "love" : "";
      dataCache.timelinePosts.value = dataCache.timelinePosts.value;
      this.timelinePost.value.liked = love;
      this.timelinePost.value = this.timelinePost.value;
    }).catchError((err){
      showError(err.toString());
    });
  }

  follow(String postId, String profileId, bool follow) {

    httpDataClientInterface.follow( profileId, follow ).then((success) {

      dataCache.timelinePosts.value.firstWhere((timelinePost) => timelinePost.id == postId).author.isLoggedUserFollowing = follow;
      dataCache.timelinePosts.value = dataCache.timelinePosts.value;

    }).catchError((err){
      showError(err.toString());
    });

  }

  deletePost(String postId, String ownerId) {
    httpDataClientInterface.deleteTimelinePost(postId, ownerId).then((success){

      dataCache.timelinePosts.value.removeWhere((timelinePost) => timelinePost.id == postId);
      dataCache.timelinePosts.value = dataCache.timelinePosts.value;

      done.value = true;

    }).catchError((err){
      showError(err.toString());
    });
  }
}
