import 'package:dio/dio.dart';
import 'package:myfti/models/article_model.dart';
import 'package:myfti/models/banner_model.dart';
import 'package:myfti/models/base_response_model.dart';
import 'package:myfti/models/information_model.dart';
import 'package:myfti/utils/client_adapter.dart';

class InformationService extends ClientAdapter {
  Future<BaseResponse<InformationModel>> getVisi({Options? options}) async {
    try {
      final response = await super.sendGetRequest('/visi', options);

      return BaseResponse<InformationModel>.fromJson(response.data,
          (json) => InformationModel.fromJson(json as Map<String, dynamic>));
    } on DioError {
      rethrow;
    }
  }

  Future<BaseResponse<InformationModel>> getMisi({Options? options}) async {
    try {
      final response = await super.sendGetRequest('/misi', options);

      return BaseResponse<InformationModel>.fromJson(response.data,
          (json) => InformationModel.fromJson(json as Map<String, dynamic>));
    } on DioError {
      rethrow;
    }
  }

  Future<BaseResponse<InformationModel>> getSejarah({Options? options}) async {
    try {
      final response = await super.sendGetRequest('/sejarah', options);

      return BaseResponse<InformationModel>.fromJson(response.data,
          (json) => InformationModel.fromJson(json as Map<String, dynamic>));
    } on DioError {
      rethrow;
    }
  }

  Future<BaseResponse<List<BannerModel>>> getBanners({Options? options}) async {
    try {
      final response = await super.sendGetRequest('/banner', options);

      return BaseResponse<List<BannerModel>>.fromJson(
          response.data,
          (json) => (json as List)
              .map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
              .toList());
    } on DioError {
      rethrow;
    }
  }

  Future<BaseResponse<List<ArticleModel>>> getArticles(
      {Options? options}) async {
    try {
      final response = await super.sendGetRequest('/artikel', options);

      return BaseResponse<List<ArticleModel>>.fromJson(
          response.data,
          (json) => (json as List)
              .map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
              .toList());
    } on DioError {
      rethrow;
    }
  }
}
