class LoginResponse {
  final String token;
  final String errMsg;

  LoginResponse({this.token, this.errMsg});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['access_token'],
      errMsg: json['error'],
    );
  }
}
