import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:golf/base/base_bloc_scaffold_widget.dart';
import 'package:golf/pages/login_and_signup/login_bloc.dart';
import 'package:golf/pages/login_and_signup/login_sign_up_layout.dart';
import 'package:golf/utils/app_colors.dart';

class Login extends StatefulWidget {

  final bool _isLogin;

  Login(this._isLogin);

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginBloc _loginBloc = LoginBloc();
  StreamSubscription _isSignedSubscription;

  @override
  void initState() {
    _isSignedSubscription = _loginBloc.goToSubject.listen((goTo) {
      if (goTo > 0) {
        if(widget._isLogin){
          if (goTo == 1)
            Navigator.pushReplacementNamed(context, "/profileSetup");
          else
            Navigator.pushReplacementNamed(context, "/home");
        }
        else
          Navigator.pushReplacementNamed(context, "/profileSetup");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _isSignedSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black
    ));

    return BaseBlocScaffoldWidget(
      _loginBloc,
      null,
      LoginSignUpLayout( widget._isLogin ? _loginBloc.login : _loginBloc.signup, widget._isLogin, _loginBloc.loginGoogle, _loginBloc.loginFacebook, _loginBloc.loginLinkedin ),
      backgroundColor: AppColors.lightWhite2,
    );
  }
}

