import 'package:flutter/material.dart';
import 'package:myfti/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final AuthService authService = AuthService();
  String? _token;

  AuthProvider() {
    getTokenFromSharedPreferences();
  }

  String get token => _token ?? '';

  set token(String token) {
    _token = token;
    notifyListeners();
  }

  Future<void> setTokenToSharedPreferences(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', value);

    token = value;
  }

  Future<void> getTokenFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('token');

    token = value ?? '';
  }

  Future<void> removeTokenFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    print("Remove token from shared preferences ${prefs.getString('token')}");

    await prefs.remove('token');

    token = '';
  }

  bool get isLogin => token.isNotEmpty;

  login(String username, String password) async {
    var result = await authService.login(username, password);

    print("Authprovider login : ${result.obj!.token!}");

    if (result.success!) {
      await setTokenToSharedPreferences(result.obj!.token!);
    }
  }
}
