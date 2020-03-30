import 'dart:async';

import 'package:dio/dio.dart';
import 'package:golf/repository/network/dio_interceptor.dart';
import 'package:golf/repository/network/model/login_response.dart';
import 'package:golf/repository/network/model/profile_view_long.dart';
import 'package:golf/repository/preferences/preferences_interface.dart';
import 'package:rxdart/rxdart.dart';

//const String URL = "http://10.0.2.2/18thandmain.com/html";
const String URL = "https://18thandsocial.com";
const String clientId = "bxuu8rccl9";

class Session {

  Dio loginDio;

  String token;
  String refreshToken;
  int _expirationTime;
  String profileId;
  ProfileViewLong profileViewLong;

  final PreferencesInterface _preferencesInterface;
  PreferencesInterface get preferencesInterface => _preferencesInterface;

  final BehaviorSubject<bool> _isSignedIn = BehaviorSubject<bool>();
  BehaviorSubject<bool> get isSignedIn => _isSignedIn;

  Session(this._preferencesInterface){

    initializeTokens();

    BaseOptions options = BaseOptions(
      baseUrl: URL,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );

    loginDio = Dio(options);
    loginDio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    loginDio.interceptors.add(DioBaseInterceptor());
  }

  dispose(){
    _isSignedIn.close();
  }

  Future<bool> login(String username, String password) async {

    Map<String, dynamic> formData = {
      "grant_type": "password",
      "username": username,
      "password": password,
      "scope": "service",
      "client_id": clientId,
    };

    final queryParams = {
      "method": "login",
    };

    Response response = await loginDio.post("/page_diginom.php", data: FormData.fromMap(formData), queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    _setupSession(LoginResponse.fromJson(response.data.result));

    return true;
  }

  Future<bool> refreshSessionToken() async {

    Map<String, dynamic> formData = {
      "client_id": clientId,
      "refresh_token": refreshToken,
    };

    final queryParams = {
      "method": "refresh_token",
    };

    Response response = await loginDio.post("/page_diginom.php", data: FormData.fromMap(formData), queryParameters: queryParams);

    if (response.data.error)
      throw Exception(response.data.errorText);

    _setupSession(LoginResponse.fromJson(response.data.result));

    return true;
  }

  Future<bool> signup(String username, String password) async {

    Map<String, dynamic> formData = {
      "email": username,
      "password": password,
      "do_submit": true,
      "name": username .split("@") .first,
      "client_id": clientId,
    };

    final queryParams = {
      "method": "sign_up",
    };

    Response response = await loginDio.post( "/page_diginom.php", data: FormData.fromMap(formData), queryParameters: queryParams );

    if (response.data.error)
      throw Exception(response.data.errorText);

    await login(username, password);

    return true;
  }

  Future<bool> loginSignupGoogle( String idToken, String email, bool isLogin ) async {
    final queryParams = {
      "method": "google_login",
    };

    Map<String, dynamic> formData = {
      "token": idToken,
      "client_id": "bxuu8rccl9",
      "email": email,
      "is_login": isLogin ? 1 : 0,
    };

    Response response = await loginDio.post("/page_diginom.php", queryParameters: queryParams, data: FormData.fromMap(formData));

    if (response.data.error)
      throw Exception(response.data.errorText);

    _setupSession(LoginResponse.fromJson(response.data.result));

    return true;
  }

  Future<bool> loginFacebook( String token, String email, bool isLogin ) async {
    final queryParams = {
      "method": "fb_login",
    };

    Map<String, dynamic> formData = {
      "token": token,
      "client_id": "bxuu8rccl9",
      "email": email,
      "is_login": isLogin ? 1 : 0,
    };

    Response response = await loginDio.post("/page_diginom.php", queryParameters: queryParams, data: FormData.fromMap(formData));

    if (response.data.error)
      throw Exception(response.data.errorText);

    _setupSession(LoginResponse.fromJson(response.data.result));

    return true;
  }

  Future<bool> loginLinkedin( String token, String email, bool isLogin  ) async {
    final queryParams = {
      "method": "lindekin_login",
    };

    Map<String, dynamic> formData = {
      "token": token,
      "client_id": "bxuu8rccl9",
      "email": email,
      "is_login": isLogin ? 1 : 0,
    };

    Response response = await loginDio.post("/page_diginom.php", queryParameters: queryParams, data: FormData.fromMap(formData));

    if (response.data.error)
      throw Exception(response.data.errorText);

    _setupSession(LoginResponse.fromJson(response.data.result));

    return true;
  }

  _setupSession(LoginResponse loginResponse) {
    token = loginResponse.accessToken;
    refreshToken = loginResponse.refreshToken;
    _preferencesInterface.setRefreshToken(refreshToken);
    _preferencesInterface.setToken(token);

    print("Session token: $token");
    print("Refresh token: $refreshToken");

    _expirationTime = DateTime.now().millisecondsSinceEpoch + loginResponse.expiresIn*1000;
    profileId = loginResponse.profileId != null ? loginResponse.profileId : profileId; //From refresh token we don't have profileId
    isSignedIn.value = true;
  }

  bool isTokenExpired() => DateTime.now().millisecondsSinceEpoch < _expirationTime;

  void initializeTokens(){
    token = _preferencesInterface.token;
    refreshToken = _preferencesInterface.refreshToken;
  }

  Future initSession() async {
    await _cleanupFileSystem();
  }

  Future<void> logout() async {
    await _cleanupFileSystem();
    _preferencesInterface.onLogout();
    token = null;
    refreshToken = null;
    _isSignedIn.value = false;
  }

  Future<void> _cleanupFileSystem() async {
//    Stream<FileSystemEntity> stream = (await getApplicationDocumentsDirectory())
//        .list();
//    stream.forEach((entry) async {
//      if (entry.path.endsWith(mp3Extension)) {
//        print("Deleting ${entry.path}");
//        await entry.delete();
//      }
//    });
//    return;
  }
}