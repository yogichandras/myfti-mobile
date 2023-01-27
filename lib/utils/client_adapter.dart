// ignore_for_file: unnecessary_overrides

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:shared_preferences/shared_preferences.dart';

Dio httpClient = Dio(
  BaseOptions(
      baseUrl: 'https://api-fti.vokratif.com/index.php/api',
      receiveTimeout: 1000),
);

class ClientAdapter extends DioForNative {
  ClientAdapter([BaseOptions? options]) {
    if (options != null) {
      httpClient.options = options;
    }

    init();
  }

  void init() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    var token = sharedPrefs.getString('token');

    httpClient.options.headers['Authorization'] = 'Bearer $token';
    httpClient.interceptors.add(ClientInterceptors());
  }

  void setHeader(String key, String value) {
    httpClient.options.headers[key] = value;
  }

  Future<Response<T>> sendGetRequest<T>(String path, Options? options) async {
    return await httpClient.get<T>(path, options: options);
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
    print('REQUEST[${options.method}] => PATH: ${options.path}');

    var sharedPrefs = await SharedPreferences.getInstance();
    var token = sharedPrefs.getString('token');

    options.headers.addAll({'Authorization': 'Bearer $token'});
    return handler.next(options);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) async {
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
