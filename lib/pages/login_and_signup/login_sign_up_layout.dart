import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:golf/localization/localization.dart';
import 'package:golf/utils/app_Box_Decoration.dart';
import 'package:golf/utils/app_colors.dart';
import 'package:golf/utils/app_styles.dart';
import 'package:golf/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:linkedin_login/linkedin_login.dart';

import 'linkedin_login.dart';

class LoginSignUpLayout extends StatefulWidget {
  final Function _loginOrSignup;
  final Function _loginOrSignupGoogle;
  final Function _loginOrSignupFacebook;
  final Function _loginOrSignupLinkedin;
  final bool _isLogin;

  LoginSignUpLayout(this._loginOrSignup, this._isLogin, this._loginOrSignupGoogle, this._loginOrSignupFacebook, this._loginOrSignupLinkedin);

  @override
  State<StatefulWidget> createState() => _LoginSignUpLayoutState();
}

class _LoginSignUpLayoutState extends State<LoginSignUpLayout> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final facebookLogin = FacebookLogin();

  //Linked in stuff
  UserObject user;
  bool logoutUser = false;
  final String redirectUrl = 'https://18thandmain.com';
  final String clientId = '78xfohke3ul1e3';
  final String clientSecret = 'pKWDWkShd3NPctT7';


  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );


  @override
  void initState() {
    if (isInDebugMode) {
      _email.text = "marko.perutovic@gmail.com";
      _password.text = "Kirdan123@";
//      _email.text = "mirkoperkovic0@gmail.com";
//      _password.text = "Mirko123";
    }

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
//        _currentUser = account;
      });
//      if (_currentUser != null) {
//        _handleGetContact();
//      }
    });

    super.initState();
  }

  _linkedInLogin() async {

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

  }

  _handleFacebookLogin() async {

    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;

        print(accessToken.token);
        print(accessToken.userId);
        print(accessToken.expires);
        print(accessToken.permissions);
        print(accessToken.declinedPermissions);

        widget._loginOrSignupFacebook( accessToken.token, "", widget._isLogin );

        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }


  }

  Future<void> _handleSignIn() async {
    try {

      _googleSignIn.signIn().then((result){
        result.authentication.then((googleKey){
          print(googleKey.accessToken);
          print(googleKey.idToken);
          print(_googleSignIn.currentUser.displayName);

          widget._loginOrSignupGoogle( googleKey.accessToken, result.email, widget._isLogin );

        }).catchError((err){
          print('inner error');
        });
      }).catchError((err){
        print('error occured');
      });

//      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    String emailValidator(String input) {
      if (input == null || input.trim().isEmpty)
        return Localization.of(context).enter_valid_email;

      RegExp regExp = RegExp( r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
      if (!regExp.hasMatch(input))
        return Localization.of(context).enter_valid_email;
      return null;
    }

    String notNullValidator(String input) {
      if (input == null || input.trim().isEmpty || input.length < 8){
        return Localization.of(context).enter_valid_password;
      }

      RegExp regExp = RegExp(r"(.*[A-Z].*)(.*\d.*)");
      if (!regExp.hasMatch(input))
        return Localization.of(context).enter_valid_password;


      return null;
    }

    return Container(
      padding: EdgeInsets.only(left: 20.0, top: 60.0, right: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Text(
                widget._isLogin
                    ? Localization.of(context).welcome_back
                    : Localization.of(context).welcome_to_app,
                style:
                    AppStyles.getSurannaStyle(24.0, 0.68, AppColors.blackColor)),

            Padding(
              padding: EdgeInsets.only(top: 80.0),
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Text(
                  widget._isLogin
                      ? Localization.of(context).login_with
                      : Localization.of(context).get_started_with,
                  style: AppStyles.getSFUITextLightStyle2(20.0, AppColors.lightBlack4, FontWeight.w300)),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 30.0),
              child: loginWithRow( _handleFacebookLogin, _handleSignIn, _linkedInLogin),
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget._isLogin
                    ? Localization.of(context).or
                    : Localization.of(context).or_sign_up_with_email,
                style: AppStyles.getSFUITextLightStyle2(20.0, AppColors.lightBlack4, FontWeight.w300),
              ),

            ),

            Padding( padding: EdgeInsets.only(top: 20.0), ),

            Form(
              key: _formKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  _buildTextField(
                      context,
                      widget._isLogin ? Localization.of(context).email : Localization.of(context).email_here,
                      _email,
                      emailValidator,
                    _emailFocus,
                    _passwordFocus
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  _buildTextField(context,
                      widget._isLogin ? Localization.of(context).password : Localization.of(context).choose_password,
                      _password,
                      notNullValidator,
                      _passwordFocus,
                      null,
                      obscure: true),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState.validate())
                        widget._loginOrSignup(_email.text, _password.text);
                    },
                    child: Container(
                        height: 40,
                        decoration: AppDecoration.logIn,
                        child: Center(
                          child: Text(
                              widget._isLogin
                                  ? Localization.of(context).log_in
                                  : Localization.of(context).sign_up,
                              style: AppStyles.getSurannaStyle2(
                                  22.0, 2.0, AppColors.greenColor,1.8)),
                        )),
                  ),
                ],
              ),
            ),

            Padding(padding: EdgeInsets.only(top: 30.0)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    widget._isLogin
                        ? Localization.of(context).need_to_join
                        : Localization.of(context).already_onboard,
                    style: AppStyles.getSFUITextLightStyle2(20.0, AppColors.lightBlack4, FontWeight.w300)),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                      widget._isLogin ? "/signup" : "/login"),
                  child: Text(
                      widget._isLogin
                          ? Localization.of(context).sign_up
                          : Localization.of(context).log_in,
                      style: AppStyles.getSurannaStyle(
                          20.0, 0.0, AppColors.greenColor)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

_buildTextField( BuildContext context, String label, TextEditingController controller, Function validator, FocusNode _currentFocusNode, FocusNode _nextFocusNode,  {bool obscure = false}) {

  return TextFormField(
      validator: validator,
      obscureText: obscure,
      focusNode: _currentFocusNode,
      controller: controller,
      textInputAction: _nextFocusNode == null ? TextInputAction.done : TextInputAction.next,
      onFieldSubmitted: (value) {
        _currentFocusNode.unfocus();
        if(_nextFocusNode != null)
          FocusScope.of(context).requestFocus(_nextFocusNode);
      },
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyColor)),
          labelText: label,
          labelStyle: TextStyle(
              fontFamily: 'SFrancisco',
              fontWeight: FontWeight.w200,
              fontSize: 20,
              color: Colors.black)
      )
    );
}

loginWithRow(Function loginFacebook, Function loginGmail, Function loginLinkedin) {

  Widget container(int id, String image) {
    return InkWell(
      onTap: () {
        switch (id ){
          case 0:
            loginFacebook();
          break;
          case 1:
            loginGmail();
          break;
          case 2:
            loginLinkedin();
          break;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColors.greyColor25,
                blurRadius: 5.0,
                offset: Offset(0.0, 1.0),
                spreadRadius: 0.0)
          ],
        ),
        child: Image.asset(image),
      ),
    );
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      container(0, 'assets/images/social-button-3.png'),
      container(1, 'assets/images/social-button-2.png'),
      container(2, 'assets/images/social-button-1.png'),
    ],
  );
}
