import 'dart:io';
import 'package:golf/bloc/base_bloc.dart';
import 'package:golf/repository/network/model/get_orgs_response.dart';
import 'package:rxdart/rxdart.dart';

class ProfileSetup4Bloc extends BaseBloc {

  final bool isMale;
  final String userName;
  final String firstName;
  final String lastName;
  final String bio;
  final File image;
  final BehaviorSubject<bool> done = BehaviorSubject.seeded(false);
  final BehaviorSubject<Organization> dropDownOrganization;

  final Organization organization;
  final List<int> sportIds;

  ProfileSetup4Bloc(this.organization, this.sportIds, this.isMale, this.userName, this.firstName, this.lastName, this.bio, this.image) : this.dropDownOrganization = BehaviorSubject.seeded(organization) {
//    dataCache.getOrganizations(false);
  }

  @override
  void dispose() {
    done.close();
    super.dispose();
  }

  setSelectedOrganization(String organizationId) {
    dropDownOrganization.value = dataCache.organizations.value.firstWhere((org) => org.id == organizationId);
  }

  saveData() async {

    try {
      await httpDataClientInterface.updateProfile( isMale, firstName, lastName, bio, image, sportIds);
    } catch (err) {
      showError(err.toString());
    }

    try {
      await httpDataClientInterface.joinLeaveOrganization(organization.id, true);
    } catch (err) {
      showError(err.toString());
    }

    _getProfileLong();
  }

  _getProfileLong() async {
    httpDataClientInterface.getProfile(session.profileId).then((profileLong){
      session.profileViewLong = profileLong;
      done.value = true;
    }).catchError((err){
      showError(err.toString());
    });
  }

}
