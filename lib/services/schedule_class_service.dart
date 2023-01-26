import 'package:dio/dio.dart';
import 'package:myfti/models/base_response_model.dart';
import 'package:myfti/models/schedule_class_model.dart';
import 'package:myfti/utils/client_adapter.dart';

class ScheduleClassService extends ClientAdapter {
  Future<BaseResponse<List<ScheduleClassModel>>> getScheduleClasses() async {
    try {
      final response = await super.sendGetRequest('/kelas');

      return BaseResponse<List<ScheduleClassModel>>.fromJson(
          response.data,
          (json) => (json as List)
              .map(
                  (e) => ScheduleClassModel.fromJson(e as Map<String, dynamic>))
              .toList());
    } on DioError {
      rethrow;
    }
  }
}
