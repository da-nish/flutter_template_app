import 'package:dio/dio.dart';
import 'package:ps_api/core/interceptors/retry_interceptor.dart';
import 'package:ps_api/core/utils/custom_logger.dart';

enum PSRequestType { public, secure }

class PSAPIClient {
  PSAPIClient._();

  static PSAPIClient instance = PSAPIClient._();

  Dio _publicClientInstance = Dio();
  Dio get publicClientInstance => _publicClientInstance;

  Dio _secureClientInstance = Dio();
  Dio get secureClientInstance => _secureClientInstance;

  Dio _dummyClientInstance = Dio();
  Dio get dummyClientInstance => _dummyClientInstance;

  final _prettyDioLogger = PSCustomAPILogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true, //kDebugMode,
    responseHeader: false,
    error: true,
    compact: true,
  );

  BaseOptions get _options => BaseOptions(
    connectTimeout: const Duration(milliseconds: 16 * 1000),
    receiveTimeout: const Duration(milliseconds: 16 * 1000),
    sendTimeout: const Duration(milliseconds: 16 * 1000),
    headers: {"x-cid": "mnik"},
  );

  void setConfig({
    required String baseUrl,
    required bool displayLog,
    Function(String)? errorHandler,
    required List<Interceptor> secureInterceptors,
    required List<Interceptor> publicInterceptors,
  }) {
    if (errorHandler != null) {}
    _publicClientInstance = _setClient(
      clientType: PSRequestType.public,
      baseUrl: baseUrl,
      displayLog: displayLog,
      interceptors: publicInterceptors,
    );
    _secureClientInstance = _setClient(
      clientType: PSRequestType.secure,
      baseUrl: baseUrl,
      displayLog: displayLog,
      interceptors: secureInterceptors,
    );
    _dummyClientInstance = setDummyClient();
  }

  Dio _setClient({
    required PSRequestType clientType,
    required String baseUrl,
    required bool displayLog,
    required List<Interceptor> interceptors,
  }) {
    final Dio client = clientType == PSRequestType.public
        ? _publicClientInstance
        : _secureClientInstance;
    client.options = _options.copyWith(baseUrl: baseUrl);

    client.interceptors.clear();

    for (Interceptor element in interceptors) {
      client.interceptors.add(element);
    }
    client.interceptors.add(
      DioRetryInterceptor.getRetryInterceptor(dio: client, retries: 3)
    );

    if (displayLog) {
      client.interceptors.add(_prettyDioLogger);
    }
    return client;
  }

  void setSecureClientAuthTokens({required String accessToken}) {
    PSCustomLogger.log(
      header: "Dio Header Update",
      text: accessToken.substring(0, 40),
      label: "SET: auth token",
    );
    final client = _getClient(PSRequestType.secure);
    client.options.headers["authorizationToken"] = "Bearer $accessToken";
    client.options.headers["authorization"] = "Bearer $accessToken";
    // print(_httpTokenInstance.hashCode);
  }

  Dio _getClient(PSRequestType clientType) {
    final client = clientType == PSRequestType.public
        ? _publicClientInstance
        : _secureClientInstance;
    return client;
  }

  void removeClientAuthTokens(PSRequestType clientType) {
    final client = _getClient(clientType);
    client.options.headers.remove("authorizationToken");
    client.options.headers.remove("authorization");
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
        // debugPrint(":::Dummy Request:::");
      },
    );
    _dummyClientInstance.interceptors.clear();
    _dummyClientInstance.options = _options.copyWith();
    _dummyClientInstance.interceptors.add(dummyLogger);
    return _dummyClientInstance;
  }

  void setContentTypeApplicationJson(PSRequestType clientType) {
    final client = _getClient(clientType);
    client.options.contentType = "application/json";
  }
}
