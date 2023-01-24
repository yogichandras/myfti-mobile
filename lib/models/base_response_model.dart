class BaseResponse {
  final dynamic obj;
  final bool success;
  final String message;

  BaseResponse(
      {required this.obj, required this.success, required this.message});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      message: json['message'],
      success: json['success'],
      obj: json['obj'],
    );
  }
}
