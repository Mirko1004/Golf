import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:golf/bloc/data_cache.dart';
import 'package:golf/bloc/session.dart';
import 'package:golf/di/inject.dart';
import 'package:golf/localization/localization_delegate.dart';
import 'package:golf/pages/home/home.dart';
import 'package:golf/pages/profile_setup/step1/profile_setup_1.dart';
import 'package:golf/pages/splash/splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'pages/login_and_signup/login.dart';

void main() async {
  await Injection.initInjection();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(new MyApp());
}

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final Session _session = Injection.injector.get<Session>();
  final DataCache _dataCache = Injection.injector.get<DataCache>();

  @override
  void dispose() {
    _dataCache.dispose();
    _session.dispose();
    Injection.injector.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black
    ));

    return MaterialApp(
      localizationsDelegates: [
        LocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      routes: <String,WidgetBuilder>{
        '/login': (BuildContext context)=> Login(true),
        "/signup": (BuildContext context)=> Login(false),
        '/home': (BuildContext context)=> Home(),
        '/splash': (BuildContext context)=> Splash(),
        '/profileSetup': (BuildContext context)=> ProfileSetup1(),
      },
      home: Splash(),
//      home: ProfileSetup1(),
//      home: Login(true),
    );
  }
}