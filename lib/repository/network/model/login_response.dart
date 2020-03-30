
class LoginResponse {

  String accessToken;
  int expiresIn;
  String tokenType;
  String scope;
  String refreshToken;
  String profileId;

  LoginResponse(this.accessToken, this.expiresIn, this.tokenType, this.scope, this.refreshToken, this.profileId);

  factory LoginResponse.fromJson( Map<String, dynamic> json ) {
    return LoginResponse(
      json["access_token"],
      json["expires_in"],
      json["token_type"],
      json["scope"],
      json["refresh_token"],
      json["profile_id"],
    );
  }

}