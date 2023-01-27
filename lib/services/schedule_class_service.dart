import 'package:dio/dio.dart';
import 'package:myfti/models/base_response_model.dart';
import 'package:myfti/models/schedule_class_model.dart';
import 'package:myfti/utils/client_adapter.dart';

class ScheduleClassService extends ClientAdapter {
  Future<BaseResponse<List<ScheduleClassModel>>> getScheduleClasses(
      {Options? options}) async {
    try {
      final response = await super
          .sendGetRequest('/kelas', Options(headers: {'requireToken': 'true'}));

      return BaseResponse<List<ScheduleClassModel>>.fromJson(
          response.data,
          (json) => (json as List)
              .map(
                  (e) => ScheduleClassModel.fromJson(e as Map<String, dynamic>))
              .toList());
    } on DioError catch (e) {
      throw BaseResponse.fromError(e);
    }
  }
}
