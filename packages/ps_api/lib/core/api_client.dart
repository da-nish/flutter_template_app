import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ps_api/core/interceptor/app_param_interceptor.dart';

import 'utils/custom_logger.dart';

class PSAPIClient {
  PSAPIClient._();

  static PSAPIClient instance = PSAPIClient._();

  static String _baseUrl = '';
  static bool _displayLog = true;
  static String _clientIdentifier = "-";

  Dio? _httpInstance;
  Dio get httpInstance => _httpInstance ?? setHttpClient(dioInterceptors: []);

  Dio? _httpTokenInstance;
  Dio get httpTokenInstance => _httpTokenInstance ?? setHttpClient(dioInterceptors: []);

  Dio? _dummyClientInstance;
  Dio get dummyClientInstance => _dummyClientInstance ?? setDummyClient();  

  final _prettyDioLogger = PSCustomAPILogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true, //kDebugMode,
    responseHeader: false,
    error: true,
    compact: true,
  );
  // Environment environment = Get.find<Environment>();
  //  _instance!.options.headers["1212"] = "ABCD"; pass header like this.

  BaseOptions get _options => BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(milliseconds: 16 * 1000),
      receiveTimeout: const Duration(milliseconds: 16 * 1000),
      sendTimeout: const Duration(milliseconds: 16 * 1000),
      headers: {"x-cid": "mnik"},
    );


  void setConfig({
    required String baseUrl,
    required bool displayLog,
    Function(String)? errorHandler,
    required String clientIdentifier,
    required List<Interceptor> interceptors,
  }) {
    _baseUrl = baseUrl;
    _displayLog = displayLog;
    _clientIdentifier = clientIdentifier;
    if (errorHandler != null) {}

    // Environment environment = Get.find<Environment>();
    // _baseUrl = environment.baseURL;
    _httpInstance = setHttpClient(dioInterceptors: interceptors);
    _httpTokenInstance = setTokenClient(dioInterceptors: interceptors);
    _dummyClientInstance = setDummyClient();
  }

  Dio setHttpClient({required List<Interceptor> dioInterceptors}) {
    if (_httpInstance == null) {
      _httpInstance = Dio(_options.copyWith());
    } else {
      _httpInstance!.interceptors.clear();
    }

    for (Interceptor element in dioInterceptors) {
      _httpInstance!.interceptors.add(element);
    }
    if (_displayLog) {
      _httpInstance!.interceptors.add(_prettyDioLogger);
    }

    _httpInstance!.interceptors
        .add(AppParamInterceptor(appIdentifier: _clientIdentifier));

    return _httpInstance!;
  }

  ///returns a Dio client with Access token in header
  Dio setTokenClient({required List<Interceptor> dioInterceptors}) {
    if (_httpTokenInstance == null) {
      _httpTokenInstance = Dio(_options.copyWith());
    } else {
      _httpTokenInstance!.interceptors.clear();
    }

    for (Interceptor element in dioInterceptors) {
      _httpTokenInstance!.interceptors.add(element);
    }
    if (_displayLog) {
      _httpTokenInstance!.interceptors.add(_prettyDioLogger);
    }

    _httpTokenInstance!.interceptors
        .add(AppParamInterceptor(appIdentifier: _clientIdentifier));

    return _httpTokenInstance!;
  }

  void setClientAuthTokens({required String accessToken}) {
    PSCustomLogger.log(
      header: "Dio Header Update",
      text: accessToken,
      label: "SET: auth token",
    );
    _httpTokenInstance?.options.headers["authorizationToken"] =
        "Bearer $accessToken";
    _httpTokenInstance?.options.headers["authorization"] =
        "Bearer $accessToken";

    // print(_httpTokenInstance.hashCode);
  }

  void removeClientAuthTokens() {
    _httpTokenInstance?.options.headers.remove("authorizationToken");
    _httpTokenInstance?.options.headers.remove("authorization");
  }

  Dio setDummyClient() {
    PSCustomAPILogger dummyLogger = PSCustomAPILogger(
      requestHeader: true,
      requestBody: false,
      responseBody: false, //kDebugMode,
      responseHeader: false,
      error: true,
      compact: true,
      logPrint: (object) {
        debugPrint(":::Dummy Request:::");
      },
    );

    if (_dummyClientInstance == null) {
      _dummyClientInstance = Dio(_options);
      _dummyClientInstance!.interceptors.add(dummyLogger);
      return _dummyClientInstance!;
    } else {
      _dummyClientInstance!.interceptors.clear();
      _dummyClientInstance!.interceptors.add(dummyLogger);
      return _dummyClientInstance!;
    }
  }

  PSAPIClient.setContentTypeApplicationJson() {
    _httpInstance?.options.contentType = "application/json";
  }
}
