import 'dart:async';

import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/repository/network/model/profile_view_long.dart';
import 'package:rxdart/rxdart.dart';

class MemberListBloc extends BaseBloc {

  final String organizationId;
  final BehaviorSubject<bool> isGetMembers = BehaviorSubject.seeded(true);
  StreamSubscription getMembersStreamSubscription;

  final BehaviorSubject<bool> loadMoreMembers = BehaviorSubject.seeded(false);
  final BehaviorSubject<List<ProfileViewLong>> memberPofileViewLongList = BehaviorSubject.seeded(List<ProfileViewLong>());
  final BehaviorSubject<bool> loadMoreStuff = BehaviorSubject.seeded(false);
  final BehaviorSubject<List<ProfileViewLong>> staffProfileViewLongList = BehaviorSubject.seeded(List<ProfileViewLong>());

  final BehaviorSubject<List<String>> followedMembersIdList = BehaviorSubject.seeded(List<String>());
  final BehaviorSubject<List<String>> followedStaffIdList = BehaviorSubject.seeded(List<String>());

  String searchString = "";

  MemberListBloc(this.organizationId){
//    getData(false);

    getMembersStreamSubscription = isGetMembers.listen((isMembers){
      getData(false);
    });
  }

  @override
  void dispose() {
    getMembersStreamSubscription?.cancel();
    followedMembersIdList.close();
    followedStaffIdList.close();
    isGetMembers.close();
    loadMoreMembers.close();
    memberPofileViewLongList.close();
    loadMoreStuff.close();
    staffProfileViewLongList.close();
    super.dispose();
  }

  getData(bool loadMore){
    if(isGetMembers.value){
      if(searchString.isEmpty)
        _getMembers(loadMore);
      else
        _searchMembers(loadMore);
    }

    else {
      if(searchString.isEmpty)
        _getStaff(loadMore);
      else
        _searchStaff(loadMore);
    }
  }

  _getMembers(bool loadMore) {

    int start = 0;
    if(loadMore){
      start = memberPofileViewLongList.value.length;
    } else {
      loadMoreMembers.value = false;
     // memberPofileViewLongList.value = List();
      followedMembersIdList.value = List();
    }

    //Get members
    httpDataClientInterface.getOrganizationMembers( organizationId, false, true, start, dataCache.postsPerPage ).then((getOrganizationMembersResponse){

      loadMoreMembers.value = getOrganizationMembersResponse.loadMore;
      if(loadMore)
      memberPofileViewLongList.value = memberPofileViewLongList.value..addAll(getOrganizationMembersResponse.profileViewLongList);
      else
        memberPofileViewLongList.value = getOrganizationMembersResponse.profileViewLongList;

      followedMembersIdList.value.addAll(memberPofileViewLongList.value.where((profile) => profile.isLoggedUserFollowing).map((profile) => profile.profile_id).toList());

    }).catchError((err){
      showError(err.toString());
    });
  }

  _searchMembers(bool loadMore) {

    int start = 0;
    if(loadMore){
      start = memberPofileViewLongList.value.length;
    } else {
      loadMoreMembers.value = false;
      //memberPofileViewLongList.value = List();
      followedMembersIdList.value = List();
    }

    //Get members
    httpDataClientInterface.searchOrganizationMembers( searchString, organizationId, false, start, dataCache.postsPerPage ).then((getOrganizationMembersResponse){

      loadMoreMembers.value = getOrganizationMembersResponse.loadMore;
      if(loadMore)
      memberPofileViewLongList.value = memberPofileViewLongList.value..addAll(getOrganizationMembersResponse.profileViewLongList);
      else
        memberPofileViewLongList.value = getOrganizationMembersResponse.profileViewLongList;
      followedMembersIdList.value.addAll(memberPofileViewLongList.value.where((profile) => profile.isLoggedUserFollowing).map((profile) => profile.profile_id).toList());

    }).catchError((err){
      showError(err.toString());
    });
  }

  _getStaff(bool loadMore) {

    int start = 0;
    if(loadMore){
      start = staffProfileViewLongList.value.length;
    } else {
      loadMoreStuff.value = false;
      //staffProfileViewLongList.value = List();
      followedStaffIdList.value = List();
    }

    //Get members
    httpDataClientInterface.getOrganizationMembers( organizationId, true, true, start, dataCache.postsPerPage ).then((getOrganizationMembersResponse){

      loadMoreStuff.value = getOrganizationMembersResponse.loadMore;
      if(loadMore)
      staffProfileViewLongList.value = staffProfileViewLongList.value..addAll(getOrganizationMembersResponse.profileViewLongList);
      else
        staffProfileViewLongList.value = getOrganizationMembersResponse.profileViewLongList;
      followedStaffIdList.value.addAll(staffProfileViewLongList.value.where((profile) => profile.isLoggedUserFollowing).map((profile) => profile.profile_id).toList());

    }).catchError((err){
      showError(err.toString());
    });
  }

  _searchStaff(bool loadMore) {

    int start = 0;
    if(loadMore){
      start = staffProfileViewLongList.value.length;
    } else {
      loadMoreStuff.value = false;
      //staffProfileViewLongList.value = List();
      followedStaffIdList.value = List();
    }

    //Get members
    httpDataClientInterface.searchOrganizationMembers( searchString, organizationId, true, start, dataCache.postsPerPage ).then((getOrganizationMembersResponse){

      loadMoreStuff.value = getOrganizationMembersResponse.loadMore;
      if(loadMore)
      staffProfileViewLongList.value = staffProfileViewLongList.value..addAll(getOrganizationMembersResponse.profileViewLongList);
      else
        staffProfileViewLongList.value = getOrganizationMembersResponse.profileViewLongList;

      followedStaffIdList.value.addAll(staffProfileViewLongList.value.where((profile) => profile.isLoggedUserFollowing).map((profile) => profile.profile_id).toList());

    }).catchError((err){
      showError(err.toString());
    });
  }

  connectDisconnect(String profileId) async {

    // ignore: close_sinks
    final followedIdList = isGetMembers.value ? followedMembersIdList : followedStaffIdList;
    bool friend;
    if ( followedIdList.value.contains(profileId) ){
      friend = false;
      followedIdList.value.remove( profileId );
    }
    else{
      friend = true;
      followedIdList.value.add( profileId );
    }

    followedIdList.value = followedIdList.value;

    httpDataClientInterface.friend(profileId,true).catchError((err){
      showError(err.toString());
    });
  }
}