import 'package:flutter/material.dart';
import 'package:golf/pages/profile_setup/common/detail_app_bar.dart';
import 'package:linkedin_login/linkedin_login.dart';

class LinkedInAuthCodeExamplePage extends StatefulWidget {

  final Function _loginOrSignupLinkedin;
  final bool _isLogin;

  const LinkedInAuthCodeExamplePage(this._loginOrSignupLinkedin, this._isLogin);

  @override
  State createState() => _LinkedInAuthCodeExamplePageState();
}

class _LinkedInAuthCodeExamplePageState
    extends State<LinkedInAuthCodeExamplePage> {
  AuthCodeObject authorizationCode;
  bool logoutUser = false;

  final String redirectUrl = 'https://18thandmain.com';
  final String clientId = '78xfohke3ul1e3';
  final String clientSecret = 'pKWDWkShd3NPctT7';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          LinkedInButtonStandardWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => LinkedInAuthCodeWidget(
                    destroySession: logoutUser,
                    redirectUrl: redirectUrl,
                    clientId: clientId,
                    onGetAuthCode: (AuthorizationCodeResponse response) {
                      print('Auth code ${response.code}');

                      print('State: ${response.state}');

                      authorizationCode = AuthCodeObject(
                        code: response.code,
                        state: response.state,
                      );
                      setState(() {});

                      Navigator.pop(context);
                    },
                    catchError: (LinkedInErrorObject error) {
                      print('Error description: ${error.description},'
                          ' Error code: ${error.statusCode.toString()}');
                      Navigator.pop(context);
                    },
                  ),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          LinkedInButtonStandardWidget(
            onTap: () {
              setState(() {
                authorizationCode = null;
                logoutUser = true;
              });
            },
            buttonText: 'Logout user',
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Auth code: ${authorizationCode?.code} '),
                Text('State: ${authorizationCode?.state} '),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class LinkedInProfileExamplePage extends StatefulWidget {
  final Function _loginOrSignupLinkedin;
  final bool _isLogin;

  const LinkedInProfileExamplePage(this._loginOrSignupLinkedin, this._isLogin);

  @override
  State createState() => _LinkedInProfileExamplePageState();
}

class _LinkedInProfileExamplePageState
    extends State<LinkedInProfileExamplePage> {
  UserObject user;
  bool logoutUser = false;

  final String redirectUrl = 'https://18thandmain.com';
  final String clientId = '78xfohke3ul1e3';
  final String clientSecret = 'pKWDWkShd3NPctT7';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getDetailAppBar(context, "Linkedin"),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[

              Padding( padding: EdgeInsets.only(top: 100.0),),

              LinkedInButtonStandardWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LinkedInUserWidget(
                        appBar: AppBar(
                          title: Text('OAuth User'),
                        ),
                        destroySession: logoutUser,
                        redirectUrl: redirectUrl,
                        clientId: clientId,
                        clientSecret: clientSecret,
                        onGetUserProfile: (LinkedInUserModel linkedInUser) {
                          print('Access token ${linkedInUser.token.accessToken}');

                          print('User id: ${linkedInUser.userId}');

                          user = UserObject(
                            firstName: linkedInUser.firstName.localized.label,
                            lastName: linkedInUser.lastName.localized.label,
                            email: linkedInUser
                                .email.elements[0].handleDeep.emailAddress,
                          );
                          setState(() {
                            logoutUser = false;
                          });

                          widget._loginOrSignupLinkedin(linkedInUser.token.accessToken, user.email, widget._isLogin);

                          Navigator.popUntil(context, ModalRoute.withName('/login'));
                        },
                        catchError: (LinkedInErrorObject error) {
                          print('Error description: ${error.description},'
                              ' Error code: ${error.statusCode.toString()}');
                          Navigator.pop(context);
                        },
                      ),
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
//              LinkedInButtonStandardWidget(
//                onTap: () {
//                  setState(() {
//                    user = null;
//                    logoutUser = true;
//                  });
//                },
//                buttonText: 'Logout',
//              ),
//              Container(
//                child: Column(
//                  mainAxisSize: MainAxisSize.max,
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Text('First: ${user?.firstName} '),
//                    Text('Last: ${user?.lastName} '),
//                    Text('Email: ${user?.email}'),
//                  ],
//                ),
//              ),

            ]
        ),
      ),
    );
  }
}

class UserObject {
  String firstName, lastName, email;

  UserObject({this.firstName, this.lastName, this.email});
}

class AuthCodeObject {
  String code, state;

  AuthCodeObject({this.code, this.state});
}

