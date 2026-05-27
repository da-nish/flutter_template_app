import 'package:connectivity_plus/connectivity_plus.dart';

class PSNetworkHelper {
  PSNetworkHelper._internal() {
    _init();
  }
  static final PSNetworkHelper instance = PSNetworkHelper._internal();

  bool _isNetworkConnected = true;
  bool _didInit = false;

  final Connectivity _connectivity = Connectivity();

  void _init() {
    isNetworkAvailable();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void addNetworkListner(Function(bool) onChange) {
    void wrappedOnChange(List<ConnectivityResult> status) {
      bool result = true;
      final ConnectivityResult value = status.first;

      switch (value) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.mobile:
          result = true;
          break;

        default:
          result = false;
          break;
      }
      onChange(result);
    }

    _connectivity.onConnectivityChanged.listen(wrappedOnChange);
  }

  Future<bool> isNetworkAvailable() async {
    if (_didInit) {
      return Future.value(_isNetworkConnected);
    }
    final List<ConnectivityResult> status = await _connectivity.checkConnectivity();
    await _updateConnectionStatus(status);
    _didInit = true;
    return Future.value(_isNetworkConnected);
  }

  /// Listen network changes
  Future<void> _updateConnectionStatus(List<ConnectivityResult> status) async {
    final ConnectivityResult result = status.first;

    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        _isNetworkConnected = true;
        break;

      default:
        _isNetworkConnected = false;
        break;
    }
  }
}
