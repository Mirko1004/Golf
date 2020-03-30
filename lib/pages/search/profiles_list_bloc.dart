import 'dart:async';
import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/repository/network/model/get_orgs_response.dart';
import 'package:golf/repository/network/model/profile_view_long.dart';
import 'package:rxdart/rxdart.dart';

class ProfilesListBloc extends BaseBloc {

  final String organizationId;
  final BehaviorSubject<bool> isGetMembers = BehaviorSubject.seeded(true);
  StreamSubscription getMembersStreamSubscription;

  final BehaviorSubject<bool> loadMoreMembers = BehaviorSubject.seeded(false);
  final BehaviorSubject<List<ProfileViewLong>> memberProfileViewLongList = BehaviorSubject.seeded(List<ProfileViewLong>());

  final BehaviorSubject<bool> loadMoreOrgs = BehaviorSubject.seeded(false);
  final BehaviorSubject<List<Organization>> organizations = BehaviorSubject.seeded(List<Organization>());


  String searchString = "";

  ProfilesListBloc(this.organizationId){
   // getData(false);

    getMembersStreamSubscription = isGetMembers.listen((isMembers){
      getData(false);
    });
  }

  @override
  void dispose() {
    getMembersStreamSubscription?.cancel();
    isGetMembers.close();
    loadMoreMembers.close();
    memberProfileViewLongList.close();
    loadMoreOrgs.close();
    organizations.close();
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
        _getOrgs(loadMore);
      else
        _searchOrgs(loadMore);
    }
  }

  _getMembers(bool loadMore) {

    int start = 0;
    if(loadMore){
      start = memberProfileViewLongList.value.length;
    } else {
      loadMoreMembers.value = false;
      //memberProfileViewLongList.value = List();

    }

    //Get members
    httpDataClientInterface.getOrganizationMembers( organizationId, false, true, start, dataCache.postsPerPage ).then((getOrganizationMembersResponse){

      loadMoreMembers.value = getOrganizationMembersResponse.loadMore;
      if(loadMore)
        memberProfileViewLongList.value = memberProfileViewLongList.value..addAll(getOrganizationMembersResponse.profileViewLongList);
      else
        memberProfileViewLongList.value = getOrganizationMembersResponse.profileViewLongList;

    }).catchError((err){
      showError(err.toString());
    });
  }

  _searchMembers(bool loadMore) {

    int start = 0;
    if(loadMore){
      start = memberProfileViewLongList.value.length;
    } else {
      loadMoreMembers.value = false;
      //memberProfileViewLongList.value = List();
    }

    //Get members
    httpDataClientInterface.searchOrganizationMembers( searchString, organizationId, false, start, dataCache.postsPerPage ).then((getOrganizationMembersResponse){

      loadMoreMembers.value = getOrganizationMembersResponse.loadMore;
      if(loadMore)
      memberProfileViewLongList.value = memberProfileViewLongList.value..addAll(getOrganizationMembersResponse.profileViewLongList);
      else
        memberProfileViewLongList.value = getOrganizationMembersResponse.profileViewLongList;

    }).catchError((err){
      showError(err.toString());
    });
  }

  _getOrgs(bool loadMore) {

    int start = 0;
    if(loadMore){
      start = organizations.value.length;
    } else {
      loadMoreOrgs.value = false;
      //organizations.value = List();

    }

    httpDataClientInterface.getOrganizations( start, dataCache.postsPerPage ).then((getOrgsResponse){

      loadMoreOrgs.value = getOrgsResponse.loadMore;
      if(loadMore)

      organizations.value = organizations.value..addAll(getOrgsResponse.organizationList);
      else
        organizations.value = getOrgsResponse.organizationList;

    }).catchError((err){
      showError(err.toString());
    });
  }

  _searchOrgs(bool loadMore) {

    int start = 0;
    if(loadMore){
      start = organizations.value.length;
    } else {
      loadMoreOrgs.value = false;
      //organizations.value = List();
    }

    httpDataClientInterface.searchOrganizations(searchString, start, dataCache.postsPerPage ).then((getOrgsResponse){

      loadMoreOrgs.value = getOrgsResponse.loadMore;
      if(loadMore)
      organizations.value = organizations.value..addAll(getOrgsResponse.organizationList);
      else
        organizations.value = getOrgsResponse.organizationList;

    }).catchError((err){
      showError(err.toString());
    });
  }

}
