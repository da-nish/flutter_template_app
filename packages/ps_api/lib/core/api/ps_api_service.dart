library ps_api;

import 'dart:async';

import 'package:dio/dio.dart' as dio;
import 'package:ps_api/core/api_client.dart';
import 'package:ps_api/core/models/api_error_model.dart';
import 'package:ps_api/core/models/response_wrapper_model.dart';
import 'package:ps_api/core/network/base_api_service.dart';

enum PSRequestMethod { post, get, request, upload }

class PSAPIService {

  final PSBaseApiService apiService = PSBaseApiService.getInstance();
  ApiErrorModel apiError = ApiErrorModel("", -1);

  Future<void> apiRequest<T>({
    required PSRequestType requestType,
    required String endPoint,
    required PSRequestMethod method,
    required T Function(dynamic) parser,
    Map<String, dynamic>? body,
    Map<String, dynamic>? qParams,
    dio.Options? options,
    bool overrideModel = false,
    Function(ApiResponseWrapper<T>)? onSuccess,
    bool urlOverride = false,
    Function(ApiResponseWrapper<T>)? onError,
    Function()? finlay,
    dio.FormData? formData,
    Function(int count, int total)? onUploadProgress,
    dio.CancelToken? cancelToken,
    // bool? cancelStatus,
  }) async {
    dio.Dio dioObject = PSAPIClient.instance.publicClientInstance;

    if (requestType == PSRequestType.secure) {
      dioObject = PSAPIClient.instance.secureClientInstance;
    }

    ApiResponseWrapper<T>? apiResponse;
    switch (method) {
      case PSRequestMethod.post:
        apiResponse = await apiService.postRequest<T>(
            url: endPoint,
            body: body ?? {},
            dio: dioObject,
            urlOverride: urlOverride,
            options: options,
            overrideModel: overrideModel,
            cancelToken: cancelToken,
            parser: parser);
        break;
      case PSRequestMethod.get:
        apiResponse = await apiService.getRequest<T>(
            url: endPoint,
            dio: dioObject,
            urlOverride: urlOverride,
            qParams: qParams,
            options: options,
            overrideModel: overrideModel,
            parser: parser);
        break;
      case PSRequestMethod.upload:
        if (formData == null) throw "FormData is required to Upload.";
        apiResponse = await apiService.uploadRequest(
          url: endPoint,
          dio: dioObject,
          parser: parser,
          path: "", 
          onUploadProgress: onUploadProgress,
          fileKey: null,
          fileName: null,
          formData: formData, 
          options: options);
        break;
      default:
        throw ApiErrorModel("Method not Found", 404);
    }

    if (apiResponse.isSuccess) {
      if (onSuccess != null) {
        await onSuccess(apiResponse);
      }
    } else {
      await onError?.call(apiResponse);
    }

    finlay?.call();
  }
}
