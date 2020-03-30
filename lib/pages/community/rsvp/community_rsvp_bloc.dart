import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/repository/network/model/profile_view_short.dart';
import 'package:rxdart/rxdart.dart';

class CommunityRsvpBloc extends BaseBloc {

  final BehaviorSubject<bool> loadMoreMembers = BehaviorSubject.seeded(false);
  final BehaviorSubject<List<ProfileViewShort>> memberProfileViewShortList = BehaviorSubject.seeded(List<ProfileViewShort>());

  final BehaviorSubject<List<String>> acceptedFriendsIdList = BehaviorSubject.seeded(List<String>());

  String searchString = "";

  CommunityRsvpBloc(){
    getData(false);
  }

  @override
  void dispose() {
    acceptedFriendsIdList.close();
    loadMoreMembers.close();
    memberProfileViewShortList.close();

    super.dispose();
  }

  getData(bool loadMore){
    if(searchString.isEmpty)
      _getFriendRequests(loadMore);
  }

  _getFriendRequests(bool loadMore) {

    int start = 0;
    if(loadMore){
      start = memberProfileViewShortList.value.length;
    } else {
      loadMoreMembers.value = false;

    }

    httpDataClientInterface.getPendingFriendRequests( start, dataCache.postsPerPage ).then((getPendingFriendRequesteResponse){

      loadMoreMembers.value = getPendingFriendRequesteResponse.loadMore;
      if(loadMore)
        memberProfileViewShortList.value = memberProfileViewShortList.value..addAll(getPendingFriendRequesteResponse.profileViewShortList);
      else
        memberProfileViewShortList.value = getPendingFriendRequesteResponse.profileViewShortList;

    }).catchError((err){
      showError(err.toString());
    });
  }

  acceptAccepted(String profileId) async {

    acceptedFriendsIdList.value.add(profileId);

    httpDataClientInterface.friend(profileId, true).then((done){

      _getFriendRequests(false);

    }).catchError((err){
      acceptedFriendsIdList.value.remove(profileId);
      showError(err.toString());
    });
  }
}