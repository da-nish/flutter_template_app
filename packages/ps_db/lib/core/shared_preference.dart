// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ps_db/core/crypto_service.dart';

class PSPreferences {
  final _crypto = AESCryptoService();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // -------------------------
  // STRING
  // -------------------------

  Future<void> _saveString(String key, String? value) async {
    await _storage.write(key: key, value: value);// _crypto.encrypt(value ?? ""));
  }

  Future<void> saveString(String key, String value) => _saveString(key, value);

  Future<String?> getString(String key, {String? defaultValue = ""}) async {
    String? encryptedValue;
    try {
      encryptedValue = await _storage.read(key: key);
    } catch (error) {
      foundation.debugPrint("1>> $error");
    }
    if (encryptedValue == null) {
      return defaultValue;
    }
    try {
      String? result = encryptedValue; // _crypto.decrypt(encryptedValue);
      return result;
    } catch (error) {
      foundation.debugPrint("2>> $error");
    }

    return null;
  }

  // -------------------------
  // INT
  // -------------------------

  Future<void> saveInt(String key, int value) async {
    await _saveString(key, value.toString());
  }

  Future<int> getInt(String key, {int defaultValue = 0}) async {
    final String? str =
        await getString(key, defaultValue: defaultValue.toString());
    final int? value = int.tryParse(str ?? "");

    if (value != null) {
      return value;
    }

    return defaultValue;
  }

  // -------------------------
  // BOOL
  // -------------------------

  Future<void> saveBoolean(String key, bool value) async {
    await saveInt(key, value ? 1 : 0);
  }

  Future<bool> getBoolean(String key, {bool defaultValue = false}) async {
    bool result = await getInt(key, defaultValue: defaultValue ? 1 : 0) == 1;
    return result;
  }

  // -------------------------
  // MAP
  // -------------------------

  Future<void> saveMap(String key, Map<dynamic, dynamic> value) async {
    return await _saveString(key, jsonEncode(value));
  }

  Future<Map<String, dynamic>> getMap(String key,
      {Map<String, dynamic> defaultValue = const {}}) async {
    try {
      final jsonString = await getString(key);
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

  // -------------------------
  // REMOVE
  // -------------------------

  Future<void> remove(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> removeAll() async {
    await _storage.deleteAll();
  }

  Future<bool> containsKey(String key) async {
    return await _storage.containsKey(key: key) ?? false;
  }
}
