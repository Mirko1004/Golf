import 'package:golf/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SplashBloc extends BaseBloc {

  final BehaviorSubject<int> goToSubject = BehaviorSubject.seeded(0);

  @override
  void dispose() {
    goToSubject.close();
    super.dispose();
  }

  refreshToken() {
    if(session.refreshToken != null && session.refreshToken.isNotEmpty) {
      session.refreshSessionToken().then((loginResponse){
        _getProfileLong();
      }).catchError((err){
        goToSubject.value = 3;
      });
    }
  }

  _getProfileLong() {
    httpDataClientInterface.getProfile(session.profileId).then((profileLong){
      session.profileViewLong = profileLong;
      if( profileLong.userOrganizations == null || profileLong.userOrganizations.isEmpty )
        goToSubject.value = 1; //If no organization, means setup of profile didn't finish - open profile setup
      else
        goToSubject.value = 2; //Open home.
    }).catchError((err){
      showError(err.toString());
    });
  }
}