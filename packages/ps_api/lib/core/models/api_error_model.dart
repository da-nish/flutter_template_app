import 'package:ps_api/core/models/response_wrapper_model.dart';

class ApiErrorModel {
  ApiErrorModel(this.message, this.httpStatusCode,
      {this.statusCode = 000, this.status = false, this.tag = ""});

  ApiErrorModel.fromJson(Map<String, dynamic> parsedJson, int? code)
      : message = parsedJson['message'] ?? "",
        status = parsedJson['status'],
        httpStatusCode = parsedJson['httpStatusCode'],
        statusCode = code ?? 000,
        tag = parsedJson['tag'];

  ApiErrorModel.from(ApiResponseWrapper responseWrapper, int? code)
      : message = (responseWrapper.message.first),
        httpStatusCode = responseWrapper.statusCode ?? 000,
        statusCode = code ?? 000,
        status = false;
  final String message;
  final int httpStatusCode;
  final bool? status;
  String? tag;
  final int statusCode;
}
