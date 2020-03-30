import 'dart:async';

import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/pages/home_page/post_row/post_row_view_model.dart';
import 'package:rxdart/rxdart.dart';

class DiscoverBloc extends BaseBloc {

  final BehaviorSubject<List<PostRowViewModel>> popularThisWeekModelList = BehaviorSubject.seeded(List());
  StreamSubscription _timeLinePostsStreamSubscription;

  DiscoverBloc(){
    _timeLinePostsStreamSubscription = dataCache.timelinePosts.listen((timeLinePosts) {
      List postsWithImages = timeLinePosts.where((timeLinePost) => (timeLinePost.content.imagesAttach != null && timeLinePost.content.imagesAttach.isNotEmpty )||
          (timeLinePost.content.videoAttach != null && timeLinePost.content.videoAttach.isNotEmpty) ).toList();
      popularThisWeekModelList.value.clear();
      popularThisWeekModelList.value = popularThisWeekModelList.value..addAll(postsWithImages.map((timelinePost) => PostRowViewModel.fromTimelinePost(session.profileViewLong.profile_id, timelinePost)).toList());
    });
  }

  @override
  void dispose() {
    _timeLinePostsStreamSubscription?.cancel();
    popularThisWeekModelList.close();
    super.dispose();
  }

  reloadData() async {
    try {
      await dataCache.getEvents(false);
      await dataCache.getTimelinePosts(false);
    } catch (err) {
      showError(err.toString());
    }
  }
}
