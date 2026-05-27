
import 'package:ps_api/core/models/export.dart';

class ApiDownloadResponse<T> {

  ApiDownloadResponse.networkError(
      {this.httpStatusCode, this.responseData, this.message = ""})
      : status = ApiStatus.networkError;

  ApiDownloadResponse.serverError(
      {this.httpStatusCode, this.responseData, this.message = ""})
      : status = ApiStatus.serverError;

  ApiDownloadResponse.from({
    this.httpStatusCode,
    this.responseData,
    this.message = "",
    this.isOfflineData = false,
  }) : status = responseData != null ? ApiStatus.success : ApiStatus.empty;
  ApiErrorModel? apiErrorModel;
  T? responseData;
  int? httpStatusCode;
  ApiStatus status;
  String? message = "";
  bool isOfflineData = false;

  bool get isSuccess => status == ApiStatus.success;
}
