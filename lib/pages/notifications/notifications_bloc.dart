import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/pages/home_page/post_row/post_row_view_model.dart';
import 'package:golf/repository/network/model/get_notifications_response.dart';
import 'package:rxdart/rxdart.dart';

class NotificationsBloc extends BaseBloc {

  final BehaviorSubject<PostRowViewModel> currentTimelinePostRowViewModel = BehaviorSubject();


  @override
  void dispose() {
    currentTimelinePostRowViewModel.close();
    super.dispose();
  }

  getData(bool loadMore) async {
    await dataCache.getNotifications(loadMore).catchError((err){
      showError(err.toString());
    });
  }

  markNotificationsRead() {
    httpDataClientInterface.markNotificationsRead().then((done){
      dataCache.getNewNotificationCount();
    }).catchError((err){
      showError(err.toString());
    });
  }

  processNotification(SysNotification sysNotification) {

    if(sysNotification.actionType == "post_common" && sysNotification.objectType == "bx_timeline")
      _getTimelinePost(sysNotification.bxTimelineEventId, sysNotification.actionOwnerId );
    else if(sysNotification.actionType == "commentPost" || sysNotification.objectType == "bx_timeline" )
      _getTimelinePost(sysNotification.bxTimelineEventId, null );
    else if(sysNotification.actionType == "doVote" || sysNotification.objectType == "bx_timeline_reactions" )
      _getTimelinePost(sysNotification.bxTimelineEventId, null );

  }

  _getTimelinePost(String timelinePostId, String ownerId) {

    httpDataClientInterface.getOneTimelinePosts(timelinePostId, ownerId).then((timelinePost){

      PostRowViewModel postRowViewModel = PostRowViewModel.fromTimelinePost(session.profileViewLong.profile_id, timelinePost);
      currentTimelinePostRowViewModel.value = postRowViewModel;

    }).catchError((err){
      showError(err.toString());
    });

  }
}
