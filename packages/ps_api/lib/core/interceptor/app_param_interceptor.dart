import 'package:dio/dio.dart';

class AppParamInterceptor extends Interceptor {
  final String appIdentifier;
  AppParamInterceptor({required this.appIdentifier});
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.method.toLowerCase() == "post" &&
        (options.data is Map<String, dynamic>)) {
      Map<String, dynamic> data = (options.data as Map<String, dynamic>);

      options.data = {
        ...data,
        "clientIdentifier": appIdentifier,
        "client_identifier": appIdentifier,
        "client-identifier": appIdentifier,
      };
    } else {
      options.queryParameters["clientIdentifier"] = appIdentifier;
      options.queryParameters["client_identifier"] = appIdentifier;
      options.queryParameters["client-identifier"] = appIdentifier;
    }
    return super.onRequest(options, handler);
  }
}
