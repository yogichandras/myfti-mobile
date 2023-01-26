import 'package:dio/dio.dart';
import 'package:myfti/models/banner_model.dart';
import 'package:myfti/models/base_response_model.dart';
import 'package:myfti/models/information_model.dart';
import 'package:myfti/utils/client_adapter.dart';

class InformationService extends ClientAdapter {
  Future<BaseResponse<InformationModel>> getVisi() async {
    try {
      final response = await super.sendGetRequest('/visi');

      return BaseResponse<InformationModel>.fromJson(response.data,
          (json) => InformationModel.fromJson(json as Map<String, dynamic>));
    } on DioError {
      rethrow;
    }
  }

  Future<BaseResponse<InformationModel>> getMisi() async {
    try {
      final response = await super.sendGetRequest('/misi');

      return BaseResponse<InformationModel>.fromJson(response.data,
          (json) => InformationModel.fromJson(json as Map<String, dynamic>));
    } on DioError {
      rethrow;
    }
  }

  Future<BaseResponse<InformationModel>> getSejarah() async {
    try {
      final response = await super.sendGetRequest('/sejarah');

      return BaseResponse<InformationModel>.fromJson(response.data,
          (json) => InformationModel.fromJson(json as Map<String, dynamic>));
    } on DioError {
      rethrow;
    }
  }

  Future<BaseResponse<List<BannerModel>>> getBanners() async {
    try {
      final response = await super.sendGetRequest('/banner');

      return BaseResponse<List<BannerModel>>.fromJson(
          response.data,
          (json) => (json as List)
              .map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
              .toList());
    } on DioError {
      rethrow;
    }
  }
}
