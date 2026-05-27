import 'package:ps_api/core/models/api_error_model.dart';
import 'package:ps_api/core/models/response_wrapper_model.dart';

mixin ApiFailStatus {
  static const int httpOk = 200;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int maintenance = 403;
  static const int methodNotAllowed = 405;
  static const int internalServerError = 500;
  static const int badGateWay = 502;
  static const int serviceUnavailable = 503;
  static const int requestTimeout = 504;
  static const int noInternetConnection = -101;
  static const int unknown = -102;
  static const int dioCancelRequest = 000;

  ApiErrorModel onHttpFailure(ApiResponseWrapper? response) {
    try {
      if (response != null && response.statusCode != null) {
        final int statusCode = response.statusCode!;
        switch (statusCode) {
          case httpOk:
          case badRequest:
            return ApiErrorModel.from(response, response.statusCode);
          case noInternetConnection:
            return ApiErrorModel(
                'TranslationKeys.noInternetConnection.tr', statusCode,
                statusCode: response.statusCode!);
          case internalServerError:
          case methodNotAllowed:
          case badGateWay:
          case requestTimeout:
          case serviceUnavailable:
            return ApiErrorModel(
                'TranslationKeys.technicalIssue.tr', statusCode,
                statusCode: response.statusCode!);
          case maintenance:
            return ApiErrorModel(
                'TranslationKeys.serverUnderMaintenance.tr', statusCode,
                statusCode: response.statusCode!);
          default:
            return ApiErrorModel(
                'TranslationKeys.technicalIssue.tr', statusCode,
                statusCode: response.statusCode!);
        }
      }
    } catch (e) {
      //
    }

    return ApiErrorModel('TranslationKeys.somethingWentWrong.tr', unknown,
        statusCode: response?.statusCode ?? 000);
  }
}
