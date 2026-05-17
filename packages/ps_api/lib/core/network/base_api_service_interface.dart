import 'package:dio/dio.dart';
import 'package:ps_api/core/models/response_wrapper.dart' as response;
import 'package:ps_api/core/network/api_error_response.dart';
import 'package:ps_api/core/utils/network_helper.dart';

abstract class BaseApiServiceInterface {
  Future<response.ApiResponseWrapper<T>> dummyRequest<T>({
    required String url,
    required Dio dio,
    required T Function(dynamic) parser,
    Map<String, dynamic>? qParams,
    bool responseTypesAsBytes = false,
    Options? options,
  });

  Future<response.ApiResponseWrapper<T>> postRequest<T>({
    required String url,
    required Map<String, dynamic> body,
    required Dio dio,
    required T Function(dynamic) parser,
    Options? options,
  });

  Future<response.ApiResponseWrapper<T>> getRequest<T>({
    required String url,
    required Dio dio,
    required T Function(dynamic) parser,
    Map<String, dynamic>? qParams,
    bool responseTypesAsBytes = false,
    Options? options,
  });

  Future<response.ApiResponseWrapper<T>> uploadRequest<T>({
    required String url,
    required Dio dio,
    required T Function(dynamic) parser,
    required String path,
    String fileKey,
    String fileName,
    Function(int count, int total)? onUploadProgress,
    Options? options,
    FormData? formData,
  });

  Future<dynamic> downloadRequest(
    String url,
    String path,
    Dio dio, {
    dynamic data,
    Function(int count, int total)? showDownloadProgress,
    Options? options,
  });

  response.ApiResponseWrapper<T> handleDioError<T>(DioException e) {
    if (e.type == DioExceptionType.cancel) {
      return response.ApiResponseWrapper.networkError(statusCode: ApiResponseListener.dioCancelRequest);
    }

    if (e.response != null) {

      Map<String, dynamic>? json;
      try {
        json = (e.response?.data ?? {}) as Map<String, dynamic>;
      } catch (e) {
        json = {};
      }

      return 
        response.ApiResponseWrapper.serverError(
          responseStatus: json.isNotEmpty
              ? json['responseStatus']
              : e.response?.statusMessage ?? '',
          responseCode: json.isNotEmpty ? json['responseCode'] : 'Failed',
          responseHttpCode:
              json['responseHttpCode'] ?? e.response?.statusCode ?? -1,
          message: json['response'] != null
              ? (json['response']['message'] ?? []).cast<String>()
              : ["Something went wrong"],
          statusCode: e.response?.statusCode ?? -1,
      );
    } else {
      if (e.toString().contains('SocketException')) {
        if (e.toString().contains('Network is unreachable')) {
          return 
            response.ApiResponseWrapper.networkError(
              statusCode: ApiResponseListener.noInternetConnection,
          );
        }
        return 
          response.ApiResponseWrapper.serverError(
            message: [],
            statusCode: ApiResponseListener.internalServerError,
        );
      }
      return 
        response.ApiResponseWrapper.serverError(
          message: [],
          statusCode: ApiResponseListener.unknown,
      );
    }
  }

  response.ApiResponseWrapper<T>? handleDioResponse<T>({
    required Response responseData,
    required T Function(dynamic) parser, 
    required bool overrideModel,}
  ) {
    try {
      final isListType = responseData.data is List;
      final parsedResponse = response.ApiResponseWrapper<T>.fromJson(
        json: responseData.data,
        parser: parser,
        overrideModel: overrideModel,
        isListType: isListType,
      );

      return parsedResponse;
    } catch (error) {
      throw Exception(
        "\n\n\n======================== Response Parse Failure ========================"
        "\nError: $error"
        "\n========================================================================\n\n"
        );
    }
  }

  Future<bool> isInternetConnected() async {
    return PSNetworkHelper.instance.isNetworkAvailable();
  }
}
