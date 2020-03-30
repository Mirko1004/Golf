import 'dart:async';

import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:golf/bloc/data_cache.dart';
import 'package:golf/bloc/session.dart';
import 'package:golf/repository/network/http_client_interface.dart';
import 'package:golf/repository/preferences/preferences_interface.dart';

class Injection {

  static PreferencesInterface _preferencesInterface = PreferencesInterface();

  static Injector injector;
  static Future initInjection() async {
    await _preferencesInterface.initPreferences();

    injector = Injector.getInjector();

    injector.map<PreferencesInterface>((i) => _preferencesInterface, isSingleton: true );
    injector.map<Session>( (i) => Session( _preferencesInterface ), isSingleton: true );
    injector.map<HttpDataClientInterface>((i) => HttpDataClientInterface(i.get<Session>()), isSingleton: true );
    injector.map<DataCache>( (i) => DataCache( _preferencesInterface, i.get<Session>(), i.get<HttpDataClientInterface>() ), isSingleton: true );
  }
}
