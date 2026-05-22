import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvironmentType { development, staging, production }

class Environment {
  final String baseURL;
  final bool displayLog;
  final bool crashReport;
  final EnvironmentType environmentType;

  Environment._internal({
    required this.baseURL,
    required this.displayLog,
    required this.crashReport,
    required this.environmentType,
  }) {
    toString();
  }

  static Environment initialize(EnvironmentType type) {
    String baseURL = dotenv.get("API_BASE_URL", fallback: 'API_URL/');
    String displayLog = dotenv.get("ENABLE_LOGS", fallback: 'false');
    String crashReport = dotenv.get("REPORT_CRASH", fallback: 'false');

    return Environment._internal(
      baseURL:  "https://jsonplaceholder.typicode.com", //"https://mocki.io",
      displayLog: _toBoolean(displayLog),
      crashReport: _toBoolean(crashReport),
      environmentType: type,
    );
  }

  static bool _toBoolean(String value) {
    return value.toLowerCase() == "true";
  }

  @override
  String toString() {
    // ignore: unused_local_variable
    Map<String, dynamic> map = {
      "BaseURL": baseURL,
      "DisplayLog": displayLog,
      "CrashReport": crashReport,
      "EnvironmentType": environmentType,
    };
    // CustomLogger.log(header: "Environment", mapData: map, forceDisplay: true);
    // log method internally check environment.displayLog
    // and we are accessing environment while initlizing it
    // use forceDisplay: true to prevent checking environment

    return map.toString();
  }
}
