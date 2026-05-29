


import 'package:poc_flutter_app/app/core/data/local_data/base_storage.dart';

class AuthLocalStorage extends BaseStorageService{

  Future<void> setToken(String value) async {
    await storage.saveString(AppPreferenceKey.authKey, value);
  }

  Future<String> getToken() async {
    return await storage.getString(AppPreferenceKey.authKey) ?? "";
  }

  Future<bool> contains() async {
    return await storage.containsKey(AppPreferenceKey.authKey);
  }

  Future<void> remove() async {
    return await storage.remove(AppPreferenceKey.authKey);
  }

}