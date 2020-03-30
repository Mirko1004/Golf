import 'dart:async';
import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/repository/network/model/get_orgs_response.dart';
import 'package:rxdart/rxdart.dart';

class ProfileSetup2Bloc extends BaseBloc {

  final BehaviorSubject<Organization> selectedOrganization = BehaviorSubject();
  final BehaviorSubject<bool> loadMoreOrganizations = BehaviorSubject.seeded(false);
  final BehaviorSubject<List<Organization>> organizations = BehaviorSubject.seeded(List<Organization>());
  StreamSubscription _organizationsStreamSubscription;
  StreamSubscription _loadMoreOrganizationsStreamSubscription;
  String searchString = "";

  ProfileSetup2Bloc(){
    getOrganizations(false);

    _organizationsStreamSubscription = dataCache.organizations.listen((organizations){
      this.organizations.value = List.of(organizations);
    });

    _loadMoreOrganizationsStreamSubscription = dataCache.loadMoreOrganizations.listen((loadMore){
      this.loadMoreOrganizations.value = loadMore;
    });
  }

  @override
  void dispose() {
    _organizationsStreamSubscription?.cancel();
    _loadMoreOrganizationsStreamSubscription?.cancel();
    selectedOrganization.close();
    loadMoreOrganizations.close();
    organizations.close();
    super.dispose();
  }

  selectOrganization(String organizationId) {
    selectedOrganization.value = dataCache.organizations.value.firstWhere( (organization) => organization.id == organizationId );
  }

  getOrganizations(bool loadMore) async {
    selectedOrganization.value = null;
    if(searchString.isEmpty){
      await dataCache.getOrganizations(loadMore).catchError((err){
        showError(err.toString());
      });
    } else {
      await _searchOrganizations(loadMore).catchError((err){
        showError(err.toString());
      });
    }
  }

  _searchOrganizations(bool loadMore) async {
    try {
      int start = 0;
      if(loadMore){
        start = organizations.value.length;
      } else {
        loadMoreOrganizations.value = false;
        //organizations.value = List();
      }

      GetOrgsResponse getAllOrgsResponse = await httpDataClientInterface.searchOrganizations(searchString, start, dataCache.postsPerPage);
      if(loadMore)

      organizations.value = organizations.value..addAll(getAllOrgsResponse.organizationList);
      else
        organizations.value = getAllOrgsResponse.organizationList;
      loadMoreOrganizations.value = getAllOrgsResponse.loadMore;
      organizations.value = organizations.value;
    } catch(err){
      throw err;
    }
  }
}
