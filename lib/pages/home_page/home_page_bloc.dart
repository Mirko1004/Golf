import 'dart:async';
import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/pages/home_page/post_row/post_row_view_model.dart';
import 'package:golf/repository/network/model/get_comments_response.dart';
import 'package:golf/repository/network/model/get_timeline_posts_response.dart';
import 'package:rxdart/rxdart.dart';

class HomePageBloc extends BaseBloc {

  final BehaviorSubject<List<Comment>> comments = BehaviorSubject<List<Comment>>.seeded(List());
  //Timeline posts
  final BehaviorSubject<List<PostRowViewModel>> postRowViewModelList = BehaviorSubject.seeded(List());
  StreamSubscription _timeLinePostsStreamSubscription;
  //Channel timeline posts
  final BehaviorSubject<List<PostRowViewModel>> channelPostRowViewModelList = BehaviorSubject.seeded(List());
  StreamSubscription _channelimeLinePostsStreamSubscription;

  HomePageBloc() {
    _timeLinePostsStreamSubscription = dataCache.timelinePosts.listen((timeLinePosts) {
      postRowViewModelList.value = timeLinePosts.map((timeLinePost) => PostRowViewModel.fromTimelinePost(session.profileViewLong.profile_id, timeLinePost)).toList();
    });
    _channelimeLinePostsStreamSubscription = dataCache.channelTimelinePosts.listen((timeLinePosts) {
      channelPostRowViewModelList.value = timeLinePosts.map((timeLinePost) => PostRowViewModel.fromTimelinePost(session.profileViewLong.profile_id, timeLinePost)).toList();
    });
  }

  @override
  void dispose() {
    _timeLinePostsStreamSubscription?.cancel();
    _channelimeLinePostsStreamSubscription?.cancel();
    postRowViewModelList.close();
    channelPostRowViewModelList.close();
    comments.close();
    super.dispose();
  }

  getData(bool loadMore) async {
    if(!loadMore){
      await dataCache.getHighlightsPosts(false).catchError((err){
        showError(err.toString());
      });
    }
    await dataCache.getTimelinePosts(loadMore).catchError((err){
      showError(err.toString());
    });
  }

  vote(String postId) {
    TimelinePost timelinePost = dataCache.timelinePosts.value.firstWhere((post) => post.id == postId);
    bool love = timelinePost.reactions.performedByLoggedUser.isEmpty;
    timelinePost.reactions.performedByLoggedUser = love ? "love" : "";
    dataCache.timelinePosts.value = dataCache.timelinePosts.value;

    httpDataClientInterface.vote(timelinePost.id, love, timelinePost.contentVoteSystem).then((voteResponse){
//      timelinePost.reactions.performedByLoggedUser = love ? "love" : "";
    }).catchError((err){
      timelinePost.reactions.performedByLoggedUser = !love ? "love" : "";
      dataCache.timelinePosts.value = dataCache.timelinePosts.value;
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

    }).catchError((err){
      showError(err.toString());
    });
  }

  setAsViewed( String contentId, String contentSystem ){
    httpDataClientInterface.getSetAsViewed( contentId, contentSystem );
  }

}
