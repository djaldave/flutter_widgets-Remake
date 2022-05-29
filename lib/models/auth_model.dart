import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _token = "";

  bool get isLoggedIn => _isLoggedIn;
  String get token => _token;

  void login(String token) {
    _isLoggedIn = true;
    token = _token;
    // notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _token = "";
  }
}
