import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;

  AuthProvider() {
    getTokenFromSharefPreferences();
  }

  String get token => _token ?? '';

  set token(String token) {
    _token = token;
    notifyListeners();
  }

  Future<void> setTokenToSharefPreferences(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', value);

    token = value;
  }

  Future<void> getTokenFromSharefPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('token');

    token = value ?? '';
  }

  Future<void> removeTokenFromSharefPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    token = '';
  }

  bool get isLogin => token.isNotEmpty;
}
