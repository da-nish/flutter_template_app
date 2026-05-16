enum EnvironmentType { development, staging, production }

class Environment {
  final String baseURL;
  final String loginURL;
  final bool displayLog;
  final bool crashReport;
  final EnvironmentType environmentType;

  Environment._internal({
    required this.baseURL,
    required this.displayLog,
    required this.crashReport,
    required this.environmentType,
    required this.loginURL,
  }) {
    toString();
  }

  static Environment initialize(EnvironmentType type) {
  

    return Environment._internal(
      baseURL:  "https://jsonplaceholder.typicode.com", //"https://mocki.io",
      displayLog: _toBoolean("true"),
      crashReport: _toBoolean("false"),
      environmentType: type,
      loginURL: "loginURL",
    );
  }

  static bool _toBoolean(String value) {
    return value == "true";
  }

  @override
  String toString() {
    // ignore: unused_local_variable
    Map<String, dynamic> map = {
      "BaseURL": baseURL,
      "LoginURL": loginURL,
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
