import 'package:dio/dio.dart';
import 'package:myfti/models/base_response_model.dart';
import 'package:myfti/models/profile_model.dart';
import 'package:myfti/models/token_model.dart';
import 'package:myfti/utils/client_adapter.dart';

class AuthService extends ClientAdapter {
  AuthService() : super();

  Future<BaseResponse<TokenModel>> login(
      String username, String password) async {
    try {
      final response = await sendPostRequest('/login', {
        'username': username,
        'password': password,
      });

      BaseResponse<TokenModel> result = BaseResponse<TokenModel>.fromJson(
        response.data,
        (json) => TokenModel.fromJson(json as Map<String, dynamic>),
      );

      return result;
    } on DioError catch (e) {
      throw BaseResponse<TokenModel>.fromError(e);
    }
  }

  Future<void> register(Map<String, dynamic> payload) async {
    try {
      var formData = FormData.fromMap({
        'npm': payload['npm'],
        'nama': payload['nama'],
        'username': payload['username'],
        'email': payload['email'],
        'semester': payload['semester'],
        'jurusan': payload['jurusan'],
        'bio': payload['bio'],
        'foto': await MultipartFile.fromFile(payload['foto']),
        'password': payload['password'],
        'confirm_password': payload['confirm_password'],
      });

      await sendPostRequest('/register', formData,
          options: Options(
            contentType: 'multipart/form-data',
          ));
    } on DioError catch (e) {
      throw BaseResponse.fromError(e);
    }
  }

  Future<BaseResponse<ProfileModel>> getUserProfile() async {
    try {
      final response = await sendGetRequest(
          '/me',
          Options(headers: {
            'requireToken': 'true',
          }));

      BaseResponse<ProfileModel> result = BaseResponse<ProfileModel>.fromJson(
        response.data,
        (json) => ProfileModel.fromJson(json as Map<String, dynamic>),
      );

      return result;
    } on DioError catch (e) {
      throw BaseResponse.fromError(e);
    }
  }
}
