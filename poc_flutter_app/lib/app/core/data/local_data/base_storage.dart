
// ignore_for_file: unused_element



import 'package:ps_db/core/shared_preference.dart';

class AppPreferenceKey{
  static const authKey = "a";
  static const userKey = "b";
}

class BaseStorageService {
  // final PSPreferences storage;

  // BaseStorageService(this.storage);

  final PSPreferences storage = PSPreferences();

  Future<void> _saveString(String key, String value) async {
    return await storage.saveString(key, value);
  }

  Future<String?> _getString(String key, {String? defaultValue = ""}) async {
    return await storage.getString(key, defaultValue: defaultValue) ;
  }

  Future<void> _saveInt(String key, int value) async {
    return await storage.saveInt(key, value);
  }

  Future<int> _getInt(String key, {int defaultValue = 0}) async {
    return await storage.getInt(key, defaultValue: defaultValue);
  }

  Future<void> _saveBoolean(String key, bool value) async{
    return await storage.saveBoolean(key, value);
  }

  Future<bool> _getBoolean(String key, {bool defaultValue = false}) async {
    return await storage.getBoolean(key, defaultValue: defaultValue);
  }

  Future<void> _saveMap(String key, Map<dynamic, dynamic> value) async {
    return await storage.saveMap(key, value);
  }

  Future<Map<String, dynamic>> _getMap(String key,{Map<String, dynamic> defaultValue = const {}}) async {
    return await storage.getMap(key, defaultValue: defaultValue);
  }

  Future<bool> _containsKey(String key) async {
    return await storage.containsKey(key);
  }

  Future<void> _remove(String key) async {
    await storage.remove(key);
  }

  Future<void> _removeAll() async {
    await storage.removeAll();
  }
}