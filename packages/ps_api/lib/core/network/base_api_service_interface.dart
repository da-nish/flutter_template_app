import 'package:dio/dio.dart';
import 'package:ps_api/core/models/response_wrapper.dart' as response;
import 'package:ps_api/core/utils/network_helper.dart';
import 'package:ps_api/core/network/api_error_response.dart';
import 'package:ps_api/core/network/mapper.dart';

abstract class BaseApiServiceInterface {
  Future<response.ApiResponseWrapper<D>> dummyRequest<T, D>(String url, Dio dio,
      {Map<String, dynamic>? qParams,
      bool responseTypesAsBytes = false,
      Options? options});

  Future<response.ApiResponseWrapper<D>> postRequest<T, D>(
      {required String url,
      required Map<String, dynamic> body,
      required Dio dio,
      required Function(dynamic) parser,
      Options? options});

  Future<response.ApiResponseWrapper<D>> getRequest<T, D>(
      {required String url,
      required Dio dio,
      required Function(dynamic) parser,
      Map<String, dynamic>? qParams,
      bool responseTypesAsBytes = false,
      Options? options});

  Future<response.ApiResponseWrapper<T>> uploadRequest<T>(
      String url,
      String path,
      String fileKey,
      String fileName,
      Dio dio,
      Function(int count, int total)? onUploadProgress,
      {Options? options,
      FormData? formData});

  Future<dynamic> downloadRequest(String url, String path, Dio dio,
      {dynamic data,
      Function(int count, int total)? showDownloadProgress,
      Options? options});

  Future<response.ApiResponseWrapper<T>> handleDioError<T>(DioException e) {
    if (e.type == DioExceptionType.cancel) {
      return Future.value(response.ApiResponseWrapper.networkError(
          statusCode: ApiResponseListener.dioCancelRequest));
    }
    // print("=====>>> ${e.response}");
    if (e.response != null) {
      // Logger.e("DioException", error: e.error, stackTrace: e.stackTrace);
      Map<String, dynamic>? json;
      try {
        json = (e.response?.data ?? {}) as Map<String, dynamic>;
      } catch (e) {
        json = {};
      }

      return Future.value(response.ApiResponseWrapper.serverError(
          responseStatus: json.isNotEmpty
              ? json['responseStatus']
              : e.response?.statusMessage ?? '',
          responseCode: json.isNotEmpty ? json['responseCode'] : 'Failed',
          responseHttpCode:
              json['responseHttpCode'] ?? e.response?.statusCode ?? -1,
          message: json['response'] != null
              ? (json['response']['message'] ?? []).cast<String>()
              : ["Something went wrong"],
          statusCode: e.response?.statusCode ?? -1));
    } else {
      if (e.toString().contains('SocketException')) {
        if (e.toString().contains('Network is unreachable')) {
          return Future.value(response.ApiResponseWrapper.networkError(
              statusCode: ApiResponseListener.noInternetConnection));
        }
        return Future.value(response.ApiResponseWrapper.serverError(
            message: [], statusCode: ApiResponseListener.internalServerError));
      }
      return Future.value(response.ApiResponseWrapper.serverError(
          message: [], statusCode: ApiResponseListener.unknown));
    }
  }

  response.ApiResponseWrapper<D>? handleDioResponse<T, D>(
      Response response, Function(dynamic) parser,
      [bool overrideModel = false]) {
    return MapperFactory.map<T, D>(response, parser, overrideModel);
  }

  Future<bool> isInternetConnected() async {
    return PSNetworkHelper.instance.isNetworkAvailable();
  }
}
