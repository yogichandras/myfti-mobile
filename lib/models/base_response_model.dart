import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final bool? success;
  final String? message;

  @JsonKey(name: 'obj')
  final T? obj;

  BaseResponse(
      {required this.obj, required this.success, required this.message});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);

  factory BaseResponse.fromError(DioError e) {
    return BaseResponse(
      obj: null,
      success: false,
      message: e.response?.data['message'] ?? e.message,
    );
  }
}
