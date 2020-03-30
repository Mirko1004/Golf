import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/repository/network/model/get_vote_persons.dart';
import 'package:rxdart/rxdart.dart';

class LikesBloc extends BaseBloc {

  final String _contentVoteId;
  final String _contentVoteSystem;
  final BehaviorSubject<List<VotePerson>> profiles = BehaviorSubject<List<VotePerson>>.seeded(List());
  final BehaviorSubject<bool> loadMoreProfiles = BehaviorSubject.seeded(false);
  final BehaviorSubject<List<String>> followedIdList = BehaviorSubject.seeded(List());
  final int commentsPerPage = 24;

  LikesBloc(this._contentVoteId, this._contentVoteSystem){
    getVotePersons(false);
  }

  @override
  void dispose() {
    profiles.close();
    loadMoreProfiles.close();
    followedIdList.close();
    super.dispose();
  }

  follow( String profileId ) {

    bool doFollow = !followedIdList.value.contains(profileId);

    httpDataClientInterface.follow( profileId, doFollow ).then((success) {
      profiles.value.firstWhere((votePerson) => votePerson.profileId == profileId ).isLoggedUserFollowing = doFollow ;
      if(doFollow)
        followedIdList.value.add(profileId);
      else
        followedIdList.value.remove(profileId);

      followedIdList.value = followedIdList.value;

    }).catchError((err){
      showError(err.toString());
    });
  }

  getVotePersons(bool loadMore) async {
    int start = 0;
    if(loadMore){
      start = profiles.value.length;
    } else {
      loadMoreProfiles.value = false;
     // profiles.value = List();
      //followedIdList.value = List();
    }

    httpDataClientInterface.getVotePersons(_contentVoteId, _contentVoteSystem, start, commentsPerPage).then((getVotePersonsResponse){
      loadMoreProfiles.value = getVotePersonsResponse.loadMore;
      if(loadMore)
      profiles.value = profiles.value..addAll(getVotePersonsResponse.data);
      else
        profiles.value = getVotePersonsResponse.data;

      final following = profiles.value.where((votePerson) => votePerson.isLoggedUserFollowing ).map((votePerson) => votePerson.profileId ).toList();

      followedIdList.value.addAll(following);

    }).catchError((err){
      showError(err.toString());
    });
  }
}