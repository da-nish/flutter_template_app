

import 'package:poc_flutter_app/core/base/dependency_setup.dart';
import 'package:poc_flutter_app/core/env/environment_data.dart';
import 'package:poc_flutter_app/core/network/model_parser/model_register.dart';
import 'package:ps_api/core/network/api_client.dart';

class InitialBinding {

  void dependencies() {
    // SharedPreferenceManager.instance;
    // Get.put<ApiService>(ApiService.getInstance(), permanent: true);

    ModelRegister.registerModelClasses(); // IMP
    String baseURL = getIt<Environment>().baseURL;
    PSAPIClient.instance.setConfig(
      baseUrl: baseURL,
      displayLog: false,
      clientIdentifier: "IN-HOUSE_MOBILE_APP",
      interceptors: [
        //internceptors
      ],
    );
  }
}
