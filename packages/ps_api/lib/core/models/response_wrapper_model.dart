
enum ApiStatus { empty, loading, success, networkError, serverError }
class ApiResponseWrapper<T> {
  String? responseStatus;
  String? responseCode;
  int? responseHttpCode;
  List<String> message = [];
  T? data;
  int? statusCode;
  ApiStatus status;
  ApiResponseWrapper.from({
    required this.message,
    required this.data,
    required this.responseCode,
    required this.responseHttpCode,
    required this.responseStatus,
    this.statusCode,
  }) : status = data != null ? ApiStatus.success : ApiStatus.empty;
  ApiResponseWrapper.networkError({this.statusCode, this.data})
    : status = ApiStatus.networkError;

  ApiResponseWrapper.serverError({
    this.statusCode,
    this.data,
    required this.message,
    this.responseCode,
    this.responseHttpCode,
    this.responseStatus,
  }) : status = ApiStatus.serverError;

  factory ApiResponseWrapper.fromJson({
    required dynamic json,
    required T Function(dynamic json) parser,
    required bool isListType,
    bool overrideModel = true,
  }) {
    final parsedResponse = parser(
      overrideModel ? json : json['response']['data'],
    );

    if (overrideModel) {
      return ApiResponseWrapper.from(
        responseStatus: "",
        responseCode: "",
        responseHttpCode: 200,
        message: [],
        data: parsedResponse,
      );
    }

    return ApiResponseWrapper.from(
      responseStatus: (json["responseStatus"] ?? "").toString(),
      responseCode: (json["responseCode"] ?? "").toString(),
      responseHttpCode: json["responseHttpCode"] ?? 200,
      message: (json['response']['message'] ?? []).cast<String>(),
      data: parsedResponse,
    );
  }

  bool get isSuccess => status == ApiStatus.success;
}
