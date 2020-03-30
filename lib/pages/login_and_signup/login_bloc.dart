import 'package:golf/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BaseBloc {

  final BehaviorSubject<int> goToSubject = BehaviorSubject.seeded(0);

  @override
  void dispose() {
    goToSubject.close();
    super.dispose();
  }

  login(String username, String password){
    showProgress(true);
    httpDataClientInterface.login(username, password).then((loginResponse){
      showProgress(false);
      _getProfileLong();
    }).catchError((err){
      showProgress(false);
      showError(err.toString());
    });
  }

  signup(String username, String password){
    httpDataClientInterface.signup(username, password).then((loginResponse){
      _getProfileLong();
    }).catchError((err){
      showError(err.toString());
    });
  }

  loginGoogle( String idToken, String email, bool isLogin ) {
    httpDataClientInterface.loginGoogle(idToken, email, isLogin).then((loginResponse){
      _getProfileLong();
    }).catchError((err){
      showError(err.toString());
    });
  }

  loginFacebook( String idToken, String email, bool isLogin ) {
    httpDataClientInterface.loginFacebook(idToken, email, isLogin).then((loginResponse){
      _getProfileLong();
    }).catchError((err){
      showError(err.toString());
    });
  }

  loginLinkedin( String idToken, String email, bool isLogin ) {
    httpDataClientInterface.loginLinkedin(idToken, email, isLogin).then((loginResponse){
      _getProfileLong();
    }).catchError((err){
      showError(err.toString());
    });
  }

  _getProfileLong() {
    showProgress(true);
    httpDataClientInterface.getProfile(session.profileId).then((profileLong){
      showProgress(false);
      session.profileViewLong = profileLong;
      if( profileLong.userOrganizations == null || profileLong.userOrganizations.isEmpty )
        goToSubject.value = 1; //If no organization, means setup of profile didn't finish - open profile setup
      else
        goToSubject.value = 2; //Open home.
    }).catchError((err){
      showProgress(false);
      showError(err.toString());
    });
  }

}
