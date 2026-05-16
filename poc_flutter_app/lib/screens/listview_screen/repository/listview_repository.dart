


// @Riverpod(keepAlive: true)
// RecipeRepository recipeRepository(Ref ref) {
//   final networkRepository = ref.watch(networkRepositoryProvider);
//   return RecipeRepository(networkRepository: networkRepository);
// }


import 'package:poc_flutter_app/core/base/base_controller.dart';
import 'package:poc_flutter_app/core/network/endpoints/api_endpoint.dart';
import 'package:ps_api/core/models/response_wrapper.dart';

abstract class RepositoryI {
  String getDatat();

  Future<void> getUserlist<T, D>({
    Function(ApiResponseWrapper<D>)? onSuccess,
    Function(ApiResponseWrapper<D>)? onError,
    Function(ApiResponseWrapper<D>)? onResponseError,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParam,
  });

}

class ListviewRepositoryI extends BaseController implements RepositoryI{

  @override
  Future<void> getUserlist<T, D>({
    Function(ApiResponseWrapper<D>)? onSuccess,
    Function(ApiResponseWrapper<D>)? onError,
    Function(ApiResponseWrapper<D>)? onResponseError,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParam,
  }) async {
    await apiRequest<T, D>(
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
  String getDatat(){
    return "sealed";
  }
}

