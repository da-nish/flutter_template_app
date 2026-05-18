


import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

final class DioRetryInterceptor{
  
  static Interceptor getRetryInterceptor({required Dio dio, int retries = 3}) => RetryInterceptor(
        dio: dio,
        // logPrint: print, // specify log function (optional)
        retries: 3, // retry count (optional)
        retryDelays: const [
          // set delays between retries (optional)
          Duration(seconds: 1), // wait 1 sec before first retry
          Duration(seconds: 2), // wait 2 sec before second retry
          Duration(seconds: 3), // wait 3 sec before third retry
        ],
      );
}