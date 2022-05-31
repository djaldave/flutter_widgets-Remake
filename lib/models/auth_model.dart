import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthModel extends ChangeNotifier {
  bool _isLoggedIn = false;

  String _token;
  String _user = "";

  bool get isLoggedIn => _isLoggedIn;
  String get token => _token;
  String get user => _user;

  void login(String user, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = true;
    _token = token;
    _user = user;
    prefs.setString('token', token);
    print("tae");
    notifyListeners();
    print(prefs.setString('token', token));
    //notifyListeners();
  }

  void logout() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = false;
    // Contact the server to sign out.
    await Future.delayed(Duration(milliseconds: 500)); // network delay
    _token = null;
    notifyListeners();
    _user = "";
  }

  bool get isAuthenticated {
    return (_token != null);
  }
}
