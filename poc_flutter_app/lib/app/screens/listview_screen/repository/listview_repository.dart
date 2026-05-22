


// @Riverpod(keepAlive: true)
// RecipeRepository recipeRepository(Ref ref) {
//   final networkRepository = ref.watch(networkRepositoryProvider);
//   return RecipeRepository(networkRepository: networkRepository);
// }


import 'package:poc_flutter_app/app/core/base/base_controller.dart';
import 'package:poc_flutter_app/app/core/network/endpoints/api_endpoint.dart';
import 'package:ps_api/ps_api.dart';


abstract class RepositoryI {

  Future<void> getUserlist<T>({
    required T Function(dynamic) parser,
    Function(ApiResponseWrapper<T>)? onSuccess,
    Function(ApiResponseWrapper<T>)? onError,
    Function(ApiResponseWrapper<T>)? onResponseError,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParam,
  });

  Future<void> getUser<T>({
    required T Function(dynamic) parser,
    Function(ApiResponseWrapper<T>)? onSuccess,
    Function(ApiResponseWrapper<T>)? onError,
    Function(ApiResponseWrapper<T>)? onResponseError,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParam,
  });

  Future<void> getClient<T>({
    required T Function(dynamic) parser,
    Function(ApiResponseWrapper<T>)? onSuccess,
    Function(ApiResponseWrapper<T>)? onError,
    Function(ApiResponseWrapper<T>)? onResponseError,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParam,
  });

    Future<void> failRequest<T>({
    required T Function(dynamic) parser,
    Function(ApiResponseWrapper<T>)? onSuccess,
    Function(ApiResponseWrapper<T>)? onError,
    Function(ApiResponseWrapper<T>)? onResponseError,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParam,
  });

}

class ListviewRepositoryI extends BaseController implements RepositoryI{

  @override
  Future<void> getClient<T>({
    required T Function(dynamic) parser,
    Function(ApiResponseWrapper<T>)? onSuccess,
    Function(ApiResponseWrapper<T>)? onError,
    Function(ApiResponseWrapper<T>)? onResponseError,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParam,
  }) async {
    await apiRequest<T>(
      parser: parser,
      requestType: RequestType.public,
      endPoint: "https://staging-dashboard-api-v2.altcapital.ai/auth/token",
      urlOverride: true,
      method: RequestMethod.post,
      overrideModel: false,
      body: body,
      qParams: queryParam,
      onSuccess: onSuccess,
      onError: onError,
      // onResponseError: onResponseError,
    );
  }

  @override
  Future<void> getUserlist<T>({
    required T Function(dynamic) parser,
    Function(ApiResponseWrapper<T>)? onSuccess,
    Function(ApiResponseWrapper<T>)? onError,
    Function(ApiResponseWrapper<T>)? onResponseError,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParam,
  }) async {
    await apiRequest<T>(
      parser: parser,
      requestType: RequestType.public,
      endPoint: APIEndpoint.userlist,
      method: RequestMethod.get,
      overrideModel: true,
      body: body,
      qParams: queryParam,
      onSuccess: onSuccess,
      onError: onError,
      // onResponseError: onResponseError,
    );
  }

  @override
  Future<void> getUser<T>({
    required T Function(dynamic) parser,
    Function(ApiResponseWrapper<T>)? onSuccess,
    Function(ApiResponseWrapper<T>)? onError,
    Function(ApiResponseWrapper<T>)? onResponseError,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParam,
  }) async {
    await apiRequest<T>(
      parser: parser,
      requestType: RequestType.public,
      endPoint: "https://mocki.io/v1/6b8b49c5-bc6b-4e0f-8c8a-d8c5f2a3a13b",
      method: RequestMethod.get,
      overrideModel: true,
      body: body,
      qParams: queryParam,
      onSuccess: onSuccess,
      onError: onError,
      // onResponseError: onResponseError,
    );
  }

  @override
  Future<void> failRequest<T>({
    required T Function(dynamic) parser,
    Function(ApiResponseWrapper<T>)? onSuccess,
    Function(ApiResponseWrapper<T>)? onError,
    Function(ApiResponseWrapper<T>)? onResponseError,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParam,
  }) async {
    await apiRequest<T>(
      parser: parser,
      requestType: RequestType.public,
      endPoint: "https://mock.codes/500",
      method: RequestMethod.get,
      overrideModel: true,
      body: body,
      qParams: queryParam,
      onSuccess: onSuccess,
      onError: onError,
      // onResponseError: onResponseError,
    );
  }
}

