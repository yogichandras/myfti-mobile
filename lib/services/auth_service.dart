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

  Future<BaseResponse<ProfileModel>> getUserProfile({Options? options}) async {
    try {
      final response = await sendGetRequest('/me', options);

      BaseResponse<ProfileModel> result = BaseResponse<ProfileModel>.fromJson(
        response.data,
        (json) => ProfileModel.fromJson(json as Map<String, dynamic>),
      );

      return result;
    } on DioError catch (e) {
      throw BaseResponse<ProfileModel>.fromError(e);
    }
  }
}
