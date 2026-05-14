import 'package:ps_api/core/models/result_model.dart';

class ApiResponseWrapper<T> {
  String? responseStatus;
  String? responseCode;
  int? responseHttpCode;
  List<String> message = [];
  T? data;
  int? statusCode;
  ApiStatus status;
  ApiResponseWrapper.from(
      {required this.message,
      required this.data,
      required this.responseCode,
      required this.responseHttpCode,
      required this.responseStatus,
      this.statusCode})
      : status = data != null ? ApiStatus.success : ApiStatus.empty;
  ApiResponseWrapper.networkError({this.statusCode, this.data})
      : status = ApiStatus.networkError;

  ApiResponseWrapper.serverError(
      {this.statusCode,
      this.data,
      required this.message,
      this.responseCode,
      this.responseHttpCode,
      this.responseStatus})
      : status = ApiStatus.serverError;

  factory ApiResponseWrapper.fromJson(Map<String, dynamic> json) =>
      ApiResponseWrapper.from(
        responseStatus: json["responseStatus"],
        responseCode: json["responseCode"],
        responseHttpCode: json["responseHttpCode"],
        message: [],
        data: json["response"],
      );

  bool get isSuccess => status == ApiStatus.success;
}
