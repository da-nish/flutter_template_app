
import 'package:poc_flutter_app/app/core/base/base_controller.dart';
import 'package:poc_flutter_app/app/core/network/endpoints/api_endpoint.dart';
import 'package:ps_api/ps_api.dart';


abstract class {{FeatureName}}RepositoryI {

  Future<void> getUser<T>({
    required T Function(dynamic) parser,
    Function(ApiResponseWrapper<T>)? onSuccess,
    Function(ApiResponseWrapper<T>)? onError,
    Function(ApiResponseWrapper<T>)? onResponseError,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParam,
  });

}

class {{FeatureName}}Repository extends BaseController implements {{FeatureName}}RepositoryI{

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
}

