import 'dart:convert';

import 'package:http/http.dart' as http;

import '../json_models/login_response.dart';
import 'config.dart';

Future<LoginResponse> authenticate(String email, String password) async {
  Map<String, dynamic> body = {"email": email, 'password': password};
  var res = await http.post(Uri.parse("$API_URL/auth/login"), body: body);

  if (res.statusCode == 200 || res.statusCode == 401) {
    return LoginResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}
