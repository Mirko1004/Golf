import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesInterface{

  final String tokenKey = "token";
  final String tokenKeyExpiry = "tokenExpiry";
  final String refreshTokenKey = "refreshToken";
  final String refreshTokenKeyExpiry = "refreshTokenExpiry";

  SharedPreferences _prefs;
  Future initPreferences() async => _prefs = await SharedPreferences.getInstance();

  String get token => _prefs.getString(tokenKey);
  setToken(String token) => _prefs.setString(tokenKey, token);

  int get tokenExpiry => _prefs.getInt(tokenKeyExpiry);
  setTokenExpiry(int tokenExpiry) => _prefs.setInt(tokenKeyExpiry, tokenExpiry);

  String get refreshToken => _prefs.getString(refreshTokenKey);
  setRefreshToken(String refreshToken) => _prefs.setString(refreshTokenKey, refreshToken);

  int get refreshTokenExpiry => _prefs.getInt(refreshTokenKeyExpiry);
  setRefreshTokenExpiry(int refreshTokenExpiry) => _prefs.setInt(refreshTokenKeyExpiry, refreshTokenExpiry);

  onLogout(){
      _prefs.remove(tokenKey);
      _prefs.remove(refreshTokenKey);
    }
  }