library ps_api;

import 'dart:async';

import 'package:dio/dio.dart' as dio;
import 'package:ps_api/core/api_client.dart';
import 'package:ps_api/core/models/api_error_model.dart';
import 'package:ps_api/core/models/response_wrapper.dart';
import 'package:ps_api/core/network/base_api_service.dart';

enum PSRequestMethod { post, get, request, upload }

enum PSRequestType { authorize, public }

class PSAPIService {
  dio.Dio get dioClient => PSAPIClient.instance.httpInstance;
  dio.Dio get dioClientWithToken => PSAPIClient.instance.httpTokenInstance;
  dio.Dio get dioDummyClient => PSAPIClient.instance.dummyClientInstance;
  final PSBaseApiService apiService = PSBaseApiService.getInstance();
  ApiErrorModel apiError = ApiErrorModel("", -1);

  // Future<void> apiDummyRequest<T, D>(
  //     {required RequestType requestType,
  //     required String endPoint,
  //     required RequestMethod method,
  //     Map<String, dynamic>? body,
  //     Map<String, dynamic>? qParams,
  //     dio.Options? options,
  //     bool overrideModel = false,
  //     Function(ApiResponseWrapper<D>)? onSuccess,
  //     bool urlOverride = false,
  //     Function(ApiResponseWrapper<D>)? onError,
  //     Function()? finlay,
  //     Duration? delay = const Duration(seconds: 2),
  //     required MockJson mockJson}) async {
  //   // ignore: unused_local_variable
  //   printMagenta("Dummy API request:: $endPoint");
  //   if (delay != null) {
  //     await Future.delayed(delay, () {});
  //   }
  //   dynamic responseData = await MockJsonData.get(mockData: mockJson);

  //   ApiResponseWrapper<D>? apiResponse = await apiService.dummyRequest<T, D>(
  //       endPoint, dioDummyClient,
  //       urlOverride: urlOverride,
  //       qParams: qParams,
  //       options: options,
  //       responseData: responseData,
  //       overrideModel: overrideModel);

  //   if (apiResponse.isSuccess) {
  //     if (onSuccess != null) {
  //       await onSuccess(apiResponse);
  //     }
  //   } else {
  //     await onError?.call(apiResponse);
  //   }

  //   finlay?.call();
  // }

  Future<void> apiRequest<T, D>({
    required PSRequestType requestType,
    required String endPoint,
    required PSRequestMethod method,
    required Function(dynamic) parser,
    Map<String, dynamic>? body,
    Map<String, dynamic>? qParams,
    dio.Options? options,
    bool overrideModel = false,
    Function(ApiResponseWrapper<D>)? onSuccess,
    bool urlOverride = false,
    Function(ApiResponseWrapper<D>)? onError,
    Function()? finlay,
    dio.FormData? formData,
    Function(int count, int total)? onUploadProgress,
    dio.CancelToken? cancelToken,
    // bool? cancelStatus,
  }) async {
    dio.Dio dioObject = dioClient;
    if (requestType == PSRequestType.authorize) {
      dioObject = dioClientWithToken;
    }

    ApiResponseWrapper<D>? apiResponse;
    switch (method) {
      case PSRequestMethod.post:
        apiResponse = await apiService.postRequest<T, D>(
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
        apiResponse = await apiService.getRequest<T, D>(
            url: endPoint,
            dio: dioObject,
            urlOverride: urlOverride,
            qParams: qParams,
            options: options,
            overrideModel: overrideModel,
            parser: parser);
        break;
      // case RequestMethod.request:
      //   apiResponse = await apiService.requestApiCall<D>(endPoint, dioObject,
      //       urlOverride: urlOverride,
      //       qParams: qParams,
      //       options: options,
      //       overrideModel: overrideModel);

      //   break;
      case PSRequestMethod.upload:
        if (formData == null) throw "FormData is required to Upload.";
        apiResponse = await apiService.uploadRequest(
            endPoint, null, null, null, dioObject, onUploadProgress,
            formData: formData, options: options);
        break;
      default:
        throw ApiErrorModel("Method not Found", 404);
    }

    if (apiResponse.isSuccess) {
      if (onSuccess != null) {
        await onSuccess(apiResponse);
      }
    } else {
      // apiError = _getApiError(apiResponse);
      await onError?.call(apiResponse);
    }

    finlay?.call();
  }
}
