import 'package:dio/dio.dart';
import 'package:ps_api/core/models/api_response.dart';
import 'package:ps_api/core/models/response_wrapper.dart';
import 'package:ps_api/core/network/base_api_service_interface.dart';

class PSBaseApiService extends BaseApiServiceInterface {
  static final PSBaseApiService _instance = PSBaseApiService._internal();

  factory PSBaseApiService.getInstance() {
    return _instance;
  }

  PSBaseApiService._internal();

  @override
  Future<ApiResponseWrapper<T>> postRequest<T>(
      {required String url,
      required Map<String, dynamic> body,
      required Dio dio,
      Options? options,
      bool urlOverride = false,
      CancelToken? cancelToken,
      required T Function(dynamic) parser,
      bool overrideModel = false}) async {

    try {
      final Response response = await dio.post(
        url,
        data: body,
        options: options,
        cancelToken: cancelToken,
      );

      return Future.value(
          handleDioResponse<T>(
            responseData: response, 
            parser: parser, 
            overrideModel: false
          )
        );
    } on DioException catch (e) {
      return super.handleDioError(e);
    }
  }

  @override
  Future<ApiResponseWrapper<T>> getRequest<T>(
      {required String url,
      required Dio dio,
      required T Function(dynamic) parser,
      Map<String, dynamic>? qParams,
      bool urlOverride = false,
      bool responseTypesAsBytes = false,
      bool overrideModel = false,
      Options? options}) async {

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
          handleDioResponse<T>(
            responseData: response, 
            parser: parser, 
            overrideModel: overrideModel)
        );
    } on DioException catch (e) {
      return handleDioError(e);
    }
  }

  @override
  Future<ApiResponseWrapper<T>> uploadRequest<T>(
      {required String url,
      required Dio dio,
      required T Function(dynamic) parser,
      String? path,
      String? fileKey,
      String? fileName,
      Function(int count, int total)? onUploadProgress,
      Options? options,
      FormData? formData}) async {
    
    try {
      // url = "${Environment.staticBaseUrl}$url";
      final fd = formData ??
          FormData.fromMap({
            (fileKey ?? ""):
                await MultipartFile.fromFile(path ?? "", filename: fileName),
          });
      final response = await dio.post(url,
          data: fd, onSendProgress: onUploadProgress, options: options);
      return Future.value(
          handleDioResponse<T>(
            responseData: response, 
            parser: parser, 
            overrideModel: false
          )
        );
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
    // if (!(await isInternetConnected())) {
    //   return Future.value(ApiResponseWrapper.networkError(
    //       statusCode: ApiResponseListener.noInternetConnection));
    // }

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
  Future<ApiResponseWrapper<T>> dummyRequest<T>(
    {required String url,
    required Dio dio, 
    required T Function(dynamic) parser,
    Map<String, dynamic>? qParams,
    bool urlOverride = false,
    bool responseTypesAsBytes = false,
    bool overrideModel = false,
    Options? options,
    dynamic responseData,
  }) async {

    try {
      Response response =
          Response(data: responseData, requestOptions: RequestOptions());
      return Future.value(
          handleDioResponse<T>(
            responseData: response, 
            parser: parser, 
            overrideModel: overrideModel
          )
        );
    } on DioException catch (e) {
      return handleDioError(e);
    }
  }
}
