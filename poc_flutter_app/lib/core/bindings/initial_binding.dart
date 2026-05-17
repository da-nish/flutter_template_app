

import 'package:poc_flutter_app/core/base/dependency_setup.dart';
import 'package:poc_flutter_app/core/env/environment_data.dart';
import 'package:ps_api/core/api_client.dart';

class InitialBinding {

  static void dependencies() {
    // SharedPreferenceManager.instance;
    // Get.put<ApiService>(ApiService.getInstance(), permanent: true);

    String baseURL = getIt<Environment>().baseURL;
    PSAPIClient.instance.setConfig(
      baseUrl: baseURL,
      displayLog: true,
      // clientIdentifier: "DEMO_APP",
      publicInterceptors: [],
      secureInterceptors: [],
    );
  }
}
