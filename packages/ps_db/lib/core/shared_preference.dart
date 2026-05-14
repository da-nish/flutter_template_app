// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/foundation.dart' as foundation;
import 'package:shared_preferences/shared_preferences.dart';

class PSPreferences {
  final String tag = "AppPreferences";

  PSPreferences._() {
    final encrypt.Key key = encrypt.Key.fromLength(32);
    _iv = encrypt.IV.fromLength(16);
    _encrypted = encrypt.Encrypter(encrypt.AES(key));
  }

  static PSPreferences instance = PSPreferences._();

  static SharedPreferences? _sharedPreferences;
  static late encrypt.Encrypter _encrypted;
  static late encrypt.IV _iv;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  static String? _encrypt(String? input) {
    if ((input ?? "").isNotEmpty) {
      final encrypt.Encrypted encrypted = _encrypted.encrypt(input!, iv: _iv);
      return encrypted.base64;
    }
    return null;
  }

  static String? _decrypt(String? input) {
    if ((input ?? "").isNotEmpty) {
      return _encrypted.decrypt64(input!, iv: _iv);
    }
    return null;
  }

  Future<bool> _saveString(String key, String? value) async {
    bool result =
        await _sharedPreferences?.setString(key, _encrypt(value) ?? "") ??
            false;
    // PSCustomLogger.log(
    //   header: "SharedPreference",
    //   label: "SET: $key",
    //   text: value,
    // );
    return result;
  }

  Future<bool> saveString(String key, String value) => _saveString(key, value);

  String? getString(String key, {String? defaultValue = ""}) {
    String? encryptedValue;
    try {
      encryptedValue = _sharedPreferences?.getString(key);
    } catch (error) {
      foundation.debugPrint("1>> $error");
    }
    if (encryptedValue == null) {
      return defaultValue;
    }
    try {
      String? result = _decrypt(encryptedValue) ?? defaultValue;
      // PSCustomLogger.log(
      //     header: "SharedPreference", label: "GET: $key", text: result);
      return result;
    } catch (error) {
      foundation.debugPrint("2>> $error");
      // GoogleCloudLoggingService.instance.writeLog(
      //   level: LogLevel.error,
      //   message: "shareed_preference.dart getString() 2: $error",
      // );
    }

    return null;
  }

  Future<bool> saveInt(String key, int value) {
    return _saveString(key, value.toString());
  }

  int getInt(String key, {int defaultValue = 0}) {
    final String? str = getString(key, defaultValue: defaultValue.toString());
    final int? value = int.tryParse(str ?? "");

    if (value != null) {
      return value;
    }
    // PSCustomLogger.log(
    //   header: "SharedPreference",
    //   label: "GET: $key",
    //   text: value?.toString(),
    // );

    return defaultValue;
  }

  Future<bool> saveBoolean(String key, bool value) {
    return saveInt(key, value ? 1 : 0);
  }

  bool getBoolean(String key, {bool defaultValue = false}) {
    bool result = getInt(key, defaultValue: defaultValue ? 1 : 0) == 1;
    // PSCustomLogger.log(
    //     header: "SharedPreference",
    //     label: "GET: $key",
    //     text: result.toString());
    return result;
  }

  Future<bool> saveMap(String key, Map<dynamic, dynamic> value) async {
    return await _saveString(key, jsonEncode(value));
  }

  Map<String, dynamic> getMap(String key,
      {Map<String, dynamic> defaultValue = const {}}) {
    try {
      final jsonString = getString(key);
      if (jsonString == null || jsonString.isEmpty) return defaultValue;
      final decoded = jsonDecode(jsonString);
      if (decoded is Map<String, dynamic>) {
        return decoded;
      }
    } catch (e) {
      foundation.debugPrint("getMap error: $e");
    }
    return defaultValue;
  }

  bool isExistKey(String key) {
    return _sharedPreferences?.containsKey(key) ?? false;
  }

  Future<void> remove(String key) async {
    // bool result =
    await _sharedPreferences?.remove(key);

    // PSCustomLogger.log(
    //     header: "SharedPreference",
    //     label: "REMOVE: $key",
    //     text: "Result: ${result.toString()}");
  }

  Future<void> removeAll() async {
    await _sharedPreferences?.clear();
  }
}
