import 'package:dio/dio.dart';
import 'package:ps_api/core/models/api_response.dart';
import 'package:ps_api/core/models/response_wrapper.dart';
import 'package:ps_api/core/network/api_error_response.dart';
import 'package:ps_api/core/network/base_api_service_interface.dart';

class PSBaseApiService extends BaseApiServiceInterface {
  static final PSBaseApiService _instance = PSBaseApiService._internal();

  factory PSBaseApiService.getInstance() {
    return _instance;
  }

  PSBaseApiService._internal();

  @override
  Future<ApiResponseWrapper<D>> postRequest<T, D>(
      {required String url,
      required Map<String, dynamic> body,
      required Dio dio,
      Options? options,
      bool urlOverride = false,
      CancelToken? cancelToken,
      required Function(dynamic) parser,
      bool overrideModel = false}) async {
    // url = urlOverride ? url : "${Environment.staticBaseUrl}$url";
    if (!(await isInternetConnected())) {
      return Future.value(
        ApiResponseWrapper.networkError(
            statusCode: ApiResponseListener.noInternetConnection),
      );
    }

    try {
      final Response response = await dio.post(
        url,
        data: body,
        options: options,
        cancelToken: cancelToken,
      );

      return Future.value(
          handleDioResponse<T, D>(response, parser, overrideModel));
    } on DioException catch (e) {
      return super.handleDioError(e);
    }
  }

  @override
  Future<ApiResponseWrapper<D>> getRequest<T, D>(
      {required String url,
      required Dio dio,
      required Function(dynamic) parser,
      Map<String, dynamic>? qParams,
      bool urlOverride = false,
      bool responseTypesAsBytes = false,
      bool overrideModel = false,
      Options? options}) async {
    // url = urlOverride ? url : "${Environment.staticBaseUrl}$url";

    if (!(await isInternetConnected())) {
      return Future.value(ApiResponseWrapper.networkError(
          statusCode: ApiResponseListener.noInternetConnection));
    }
    Response response;
    try {
      if (responseTypesAsBytes) {
        Options ops = options ?? Options();
        ops.responseType = ResponseType.bytes;
        response = await dio.get(url, queryParameters: qParams, options: ops);
      } else {
        response =
            await dio.get(url, queryParameters: qParams, options: options);
      }
      return Future.value(
          handleDioResponse<T, D>(response, parser, overrideModel));
    } on DioException catch (e) {
      return handleDioError(e);
    }
  }

  // Future<ApiResponseWrapper<T>> requestApiCall<T>(String url,
  //     {Map<String, dynamic>? qParams,
  //     bool urlOverride = false,
  //     bool responseTypesAsBytes = false,
  //     bool overrideModel = false,
  //     Options? options}) async {
  //   // url = urlOverride ? url : "${Environment.staticBaseUrl}$url";

  //   if (!(await isInternetConnected())) {
  //     return Future.value(ApiResponseWrapper.networkError(
  //         statusCode: ApiResponseListener.noInternetConnection));
  //   }
  //   Response response;
  //   try {
  //     if (responseTypesAsBytes) {
  //       Options ops = options ?? Options();
  //       ops.responseType = ResponseType.bytes;
  //       response = await _dio.request(url, data: qParams, options: ops);
  //     } else {
  //       response = await _dio.request(url, data: qParams, options: options);
  //     }

  //     return Future.value(handleDioResponse(response, overrideModel));
  //   } on DioError catch (e) {
  //     return handleDioError(e);
  //   }
  // }

  @override
  Future<ApiResponseWrapper<T>> uploadRequest<T>(
      String url,
      String? path,
      String? fileKey,
      String? fileName,
      Dio dio,
      Function(int count, int total)? onUploadProgress,
      {Options? options,
      FormData? formData}) async {
    if (!(await isInternetConnected())) {
      return Future.value(ApiResponseWrapper.networkError(
          statusCode: ApiResponseListener.noInternetConnection));
    }
    try {
      // url = "${Environment.staticBaseUrl}$url";
      final fd = formData ??
          FormData.fromMap({
            (fileKey ?? ""):
                await MultipartFile.fromFile(path ?? "", filename: fileName),
          });
      final response = await dio.post(url,
          data: fd, onSendProgress: onUploadProgress, options: options);
      return Future.value(handleDioResponse(response, (_) {}));
    } on DioException catch (e) {
      return super.handleDioError(e);
    }
  }

  @override
  Future<dynamic> downloadRequest(String url, String path, Dio dio,
      {dynamic data,
      Function(int count, int total)? showDownloadProgress,
      Options? options,
      bool urlOverride = false}) async {
    if (!(await isInternetConnected())) {
      return Future.value(ApiResponseWrapper.networkError(
          statusCode: ApiResponseListener.noInternetConnection));
    }

    try {
      // url = urlOverride ? url : "${Environment.staticBaseUrl}$url";

      final response = await dio.download(url, path,
          data: data,
          options: options,
          onReceiveProgress: showDownloadProgress);
      return Future.value(ApiResponse.from(
        responseData: response,
        httpStatusCode: response.statusCode,
      ));
    } on DioException catch (e) {
      return super.handleDioError(e);
    }
  }

  @override
  Future<ApiResponseWrapper<D>> dummyRequest<T, D>(
    String url,
    Dio dio, {
    Map<String, dynamic>? qParams,
    bool urlOverride = false,
    bool responseTypesAsBytes = false,
    bool overrideModel = false,
    Options? options,
    dynamic responseData,
  }) async {
    // url = urlOverride ? url : "${Environment.staticBaseUrl}$url";

    if (!(await isInternetConnected())) {
      return Future.value(ApiResponseWrapper.networkError(
          statusCode: ApiResponseListener.noInternetConnection));
    }
    try {
      Response response =
          Response(data: responseData, requestOptions: RequestOptions());
      return Future.value(
          handleDioResponse<T, D>(response, (_) {}, overrideModel));
    } on DioException catch (e) {
      return handleDioError(e);
    }
  }
}
