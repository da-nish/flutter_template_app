import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ps_api/core/models/response_wrapper_model.dart' as response;
import 'package:ps_api/core/utils/api_fail_status.dart';
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

  Future<T> executeWithRetry<T>({
    required Future<T> Function() apiCall,
    required String url,
    int maxAttempts = 3,
    int timeoutSeconds = 8,
  }) async {
    int attempt = 0;
    while (attempt < maxAttempts) {
      try {
        attempt++;
        final result = await apiCall().timeout(
          Duration(seconds: timeoutSeconds),
        );
        return result;
        // ignore: unused_catch_clause
      } on TimeoutException catch (e) {
        if (attempt >= maxAttempts) {
          throw Exception('Timeout after $maxAttempts attempts, URL: $url');
          // AppFirebaseAnalytics.singleton.logEvent(AnalyticsEvent.apiError,
          //   info: AnalyticsEventInfo(
          //     screenData: "Failed after $maxAttempts attempts ",
          //     path: url,
          //     timeTaken: "api_attempt $attempt",
          //   ));
        }

        await Future.delayed(Duration(seconds: attempt)); // delay backoff
      } on DioException catch (e) {
        final shouldRetry =
            e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.connectionError;

        if (!shouldRetry || attempt >= maxAttempts) {
          rethrow;
        }
        await Future.delayed(Duration(seconds: attempt));
      } catch (e) {
        rethrow;
      }
    }
    throw Exception('Failed after $maxAttempts attempts, URL: $url');
  }

  response.ApiResponseWrapper<T> handleDioResponse<T>({
    required Response responseData,
    required T Function(dynamic) parser,
    required bool overrideModel,
  }) {
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
      
      // throw Exception(
      //   "\n\n\n======================== Response Parse Failure ========================"
      //   "\nError: $error"
      //   "\n========================================================================\n\n",
      // );

      return handleDioError(DioException.badResponse(statusCode: responseData.statusCode ?? 0, requestOptions: responseData.requestOptions, response: responseData));
    }
  }

  response.ApiResponseWrapper<T> handleDioError<T>(DioException e) {
    if (e.type == DioExceptionType.cancel) {
      return response.ApiResponseWrapper.networkError(
        statusCode: ApiFailStatus.dioCancelRequest,
      );
    }

    if (e.response == null) {
      return _handleNetworkError<T>(e);
    }

    final data = _extractResponseData(e.response?.data);
    return response.ApiResponseWrapper.serverError(
      responseStatus: data['responseStatus'] ?? e.response?.statusMessage ?? '',
      responseCode: data['responseCode'] ?? 'Failed',
      responseHttpCode:
          data['responseHttpCode'] ?? e.response?.statusCode ?? -1,
      message: _extractMessages(data),
      statusCode: e.response?.statusCode ?? -1,
    );
  }

  Map<String, dynamic> _extractResponseData(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data;
    }
    return {};
  }

  List<String> _extractMessages(Map<String, dynamic> data) {
    final responseData = data['response'];

    if (responseData is Map<String, dynamic>) {
      final message = responseData['message'];

      if (message is List) {
        return message.cast<String>();
      }

      if (message is String) {
        return [message];
      }
    }

    return ['Something went wrong'];
  }

  response.ApiResponseWrapper<T> _handleNetworkError<T>(DioException e) {
    final error = e.error;

    // Internet unavailable
    if (error is SocketException) {
      return response.ApiResponseWrapper.networkError(
        statusCode: ApiFailStatus.noInternetConnection,
      );
    }

    // Timeout cases
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return response.ApiResponseWrapper.networkError(
        statusCode: ApiFailStatus.requestTimeout,
      );
    }

    // Unknown error
    return response.ApiResponseWrapper.serverError(
      message: ['Unexpected error occurred'],
      statusCode: ApiFailStatus.unknown,
    );
  }

  Future<bool> isInternetConnected() async {
    return PSNetworkHelper.instance.isNetworkAvailable();
  }
}
