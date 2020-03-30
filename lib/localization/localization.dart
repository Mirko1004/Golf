import 'package:flutter/material.dart';

class Localization {
  Localization(this.locale);

  final Locale locale;

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  static Map<String, Map<String, String>> localizedValues = {
    'en': {
      //Global
      "appName": "VoiceNation",
      "appCaption": "Beyond the Call",
      "ok": "OK",
      "cancel": "CANCEL",
      "save": "SAVE",
      "delete": "DELETE",
      "errorTitle": "Error",
      "urlLaunchError": "Could not launch",

      //ListView
      "releaseToRefresh": "Release to Refresh",
      "loading": "Loading...",
      "doneLoading": "Done",
      "failedLoading": "Failed",
      "pullToRefresh": "Pull to Refresh",
      "search": "Search",

      //
      "welcome_back": "WELCOME BACK!",
      "login_with": "login with",
      "email": "email",
      "password": "password",
      "log_in": "LOG IN",
      "need_to_join": "need to join?",
      "sign_up": "SIGN UP",
      "welcome_to_app": "WELCOME TO 18TH&MAIN",
      "get_started_with": "get started with",
      "email_here": "email here",
      "choose_password": "choose password",
      "or": "or",
      "or_sign_up_with_email": "or sign up with your email",
      "already_onboard": "already onboard?",
      "enter_valid_email": "Please enter valid email",
      "enter_valid_password": "Min 8 characters long one uppercase letter and one digit",
      "join": "JOIN",
      "login": "LOGIN",
      "firstname_empty": "First Name must be not be empty!",
      "lastname_empty": "Last Name must be not be empty!",
    },
  };

  String get appName => localizedValues[locale.languageCode]['appName'];
  String get appCaption => localizedValues[locale.languageCode]['appCaption'];
  String get ok => localizedValues[locale.languageCode]['ok'];
  String get cancel => localizedValues[locale.languageCode]['cancel'];
  String get save => localizedValues[locale.languageCode]['save'];
  String get delete => localizedValues[locale.languageCode]['delete'];
  String get errorTitle => localizedValues[locale.languageCode]['errorTitle'];
  String urlLaunchError(String url) => localizedValues[locale.languageCode]['urlLaunchError'] + " $url";
  String get releaseToRefresh => localizedValues[locale.languageCode]['releaseToRefresh'];
  String get loading => localizedValues[locale.languageCode]['loading'];
  String get doneLoading => localizedValues[locale.languageCode]['doneLoading'];
  String get failedLoading => localizedValues[locale.languageCode]['failedLoading'];
  String get pullToRefresh => localizedValues[locale.languageCode]['pullToRefresh'];
  String get search => localizedValues[locale.languageCode]['search'];

  //
  String get welcome_back => localizedValues[locale.languageCode]['welcome_back'];
  String get login_with => localizedValues[locale.languageCode]['login_with'];
  String get email => localizedValues[locale.languageCode]['email'];
  String get password => localizedValues[locale.languageCode]['password'];
  String get log_in => localizedValues[locale.languageCode]['log_in'];
  String get need_to_join => localizedValues[locale.languageCode]['need_to_join'];
  String get sign_up => localizedValues[locale.languageCode]['sign_up'];
  String get welcome_to_app => localizedValues[locale.languageCode]['welcome_to_app'];
  String get get_started_with => localizedValues[locale.languageCode]['get_started_with'];
  String get email_here => localizedValues[locale.languageCode]['email_here'];
  String get choose_password => localizedValues[locale.languageCode]['choose_password'];
  String get or => localizedValues[locale.languageCode]['or'];
  String get or_sign_up_with_email => localizedValues[locale.languageCode]['or_sign_up_with_email'];
  String get already_onboard => localizedValues[locale.languageCode]['already_onboard'];
  String get enter_valid_email => localizedValues[locale.languageCode]['enter_valid_email'];
  String get enter_valid_password => localizedValues[locale.languageCode]['enter_valid_password'];
  String get join => localizedValues[locale.languageCode]['join'];
  String get login => localizedValues[locale.languageCode]['login'];
  String get firstname_empty => localizedValues[locale.languageCode]['firstname_empty'];
  String get lastname_empty => localizedValues[locale.languageCode]['lastname_empty'];
}
