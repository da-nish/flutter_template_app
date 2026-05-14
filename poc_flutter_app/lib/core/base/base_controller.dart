import 'package:dio/dio.dart' as dio;
import 'package:poc_flutter_app/core/network/model_parser/model_register.dart';
import 'package:ps_api/core/api/ps_api_service.dart';
import 'package:ps_api/core/models/response_wrapper.dart';



enum RequestMethod { post, get, request, upload }

enum RequestType { authorize, public }

abstract class BaseController {
  static final PSAPIService _base = PSAPIService();
  oninit() {
    // Initialize any necessary components or configurations here
    // PSDioProvider.instance.setConfig(baseUrl: "baseUrl", displayLog: true);
  }

  Future<void> apiRequest<T, D>({
    required RequestType requestType,
    required String endPoint,
    required RequestMethod method,
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
    dynamic parser = ModelRegister.constructors[T];

    if (parser == null) {
      throw Exception(
          "A proper constructor callback must be registered for all api model classes. Couldn't find registry for $T");
    }

    await _base.apiRequest<T, D>(
      requestType: requestType == RequestType.authorize
          ? PSRequestType.authorize
          : PSRequestType.public,
      body: body,
      qParams: qParams,
      overrideModel: overrideModel,
      urlOverride: urlOverride,
      onSuccess: onSuccess,
      onError: onError,
      finlay: finlay,
      formData: formData,
      onUploadProgress: onUploadProgress,
      cancelToken: cancelToken,
      options: options,
      endPoint: endPoint,
      method: getRequestMethod(method),
      parser: parser,
    );
  }

  PSRequestMethod getRequestMethod(RequestMethod method) {
    switch (method) {
      case RequestMethod.post:
        return PSRequestMethod.post;
      case RequestMethod.get:
        return PSRequestMethod.get;
      case RequestMethod.request:
        return PSRequestMethod.request;
      case RequestMethod.upload:
        return PSRequestMethod.upload;
      // ignore: unreachable_switch_default
      default:
        throw Exception("Invalid request method");
    }
  }
}
