// ignore_for_file: unnecessary_overrides

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientAdapter extends DioForNative {
  Dio httpClient = Dio(
    BaseOptions(
      baseUrl: 'https://api-fti.vokratif.com/index.php/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  ClientAdapter([BaseOptions? options]) {
    if (options != null) {
      httpClient.options = options;
    }

    httpClient.interceptors.add(ClientInterceptors());
  }

  void setHeader(String key, String value) {
    httpClient.options.headers[key] = value;
  }

  Future<Response<T>> sendGetRequest<T>(String path) async {
    return await httpClient.get<T>(path);
  }

  Future<Response<T>> sendPostRequest<P, T>(String path, P data) async {
    return await httpClient.post<T>(path, data: data);
  }

  Future<Response<T>> sendPutRequest<P, T>(String path, P data) async {
    return await httpClient.put<T>(path, data: data);
  }

  Future<Response<T>> sendDeleteRequest<T>(String path) async {
    return await httpClient.delete<T>(path);
  }
}

class ClientInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    var token = sharedPrefs.getString('token');

    if (token is String && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    return super.onError(err, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }
}
