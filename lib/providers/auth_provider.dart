import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myfti/models/base_response_model.dart';
import 'package:myfti/models/profile_model.dart';
import 'package:myfti/models/token_model.dart';
import 'package:myfti/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final AuthService authService = AuthService();
  String? _token;
  ProfileModel? _profile;

  AuthProvider() {
    getTokenFromSharedPreferences();
    getProfileFromSharedPreferences();
  }

  String get token => _token ?? '';
  ProfileModel get profile => _profile ?? ProfileModel();

  set token(String token) {
    _token = token;
    notifyListeners();
  }

  set profile(ProfileModel profile) {
    _profile = profile;
    notifyListeners();
  }

  Future<void> setTokenToSharedPreferences(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', value);

    token = value;
  }

  Future<void> setProfileToSharedPreferences(ProfileModel value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile', json.encode(value.toJson()));

    profile = value;
  }

  Future<void> getTokenFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('token');

    token = value ?? '';
  }

  Future<void> getProfileFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('profile');

    if (value != null) {
      var decodedProfile = json.decode(value);
      profile = ProfileModel.fromJson(decodedProfile as Map<String, dynamic>);
    }
  }

  Future<void> removeTokenFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    token = '';
  }

  Future<void> removeProfileFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('profile');

    profile = ProfileModel();
  }

  bool get isLogin => token.isNotEmpty;

  Future<BaseResponse<TokenModel>> login(
      String username, String password) async {
    var result = await authService.login(username, password);

    print("Authprovider login : ${result.obj!.token!}");

    if (result.success!) {
      await setTokenToSharedPreferences(result.obj!.token!);
    }

    return result;
  }

  Future<BaseResponse<ProfileModel>> getUserProfile({String? token}) async {
    var result = await authService.getUserProfile(
        options: Options(headers: {'requireToken': 'true'}));

    if (result.success!) {
      await setProfileToSharedPreferences(result.obj!);
    }

    return result;
  }
}
