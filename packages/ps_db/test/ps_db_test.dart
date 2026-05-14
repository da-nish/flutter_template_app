import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:ps_db/core/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late PSPreferences prefs;

  setUp(() async {
    // Setup mock initial values
    SharedPreferences.setMockInitialValues({});
    prefs = PSPreferences.instance;
    await prefs.init();
  });

  test('Save and retrieve encrypted string', () async {
    const key = 'test_string';
    const value = 'hello_encrypted';

    final saveResult = await prefs.saveString(key, value);
    expect(saveResult, true);

    final result = prefs.getString(key);
    expect(result, value);
  });

  test('Save and retrieve encrypted int', () async {
    const key = 'test_int';
    const value = 1234;

    final saveResult = await prefs.saveInt(key, value);
    expect(saveResult, true);

    final result = prefs.getInt(key);
    expect(result, value);
  });

  test('Save and retrieve encrypted boolean', () async {
    const key = 'test_bool';
    const value = true;

    final saveResult = await prefs.saveBoolean(key, value);
    expect(saveResult, true);

    final result = prefs.getBoolean(key);
    expect(result, value);
  });

  test('Get non-existing string returns default', () {
    const key = 'non_exist';
    const defaultValue = 'default';

    final result = prefs.getString(key, defaultValue: defaultValue);
    expect(result, defaultValue);
  });

  test('Get non-existing int returns default', () {
    const key = 'non_exist_int';
    const defaultValue = 99;

    final result = prefs.getInt(key, defaultValue: defaultValue);
    expect(result, defaultValue);
  });

  test('Get non-existing bool returns default', () {
    const key = 'non_exist_bool';
    const defaultValue = true;

    final result = prefs.getBoolean(key, defaultValue: defaultValue);
    expect(result, defaultValue);
  });

  test('Key existence check works', () async {
    const key = 'exist_key';
    await prefs.saveString(key, 'some_value');

    expect(prefs.isExistKey(key), true);
    expect(prefs.isExistKey('non_exist_key'), false);
  });

  test('Remove key removes the value', () async {
    const key = 'remove_key';
    await prefs.saveString(key, 'to_be_removed');

    await prefs.remove(key);

    final result = prefs.getString(key, defaultValue: null);
    expect(result, null);
  });

  test('RemoveAll clears all keys', () async {
    await prefs.saveString('key1', 'val1');
    await prefs.saveInt('key2', 42);
    await prefs.saveBoolean('key3', true);

    await prefs.removeAll();

    expect(prefs.isExistKey('key1'), false);
    expect(prefs.isExistKey('key2'), false);
    expect(prefs.isExistKey('key3'), false);
  });

  test('SaveMap ', () async {
    final Map dd = {"a": "b", "c": 1};
    await prefs.saveMap('key11', dd);
    final s = await prefs.getMap('key11');

    print("res:1: ${s}");
  });

  test('Save and retrieve encrypted map', () async {
    const key = 'test_map';
    final map = {'name': 'Alice', 'age': 30};

    final saveResult = await prefs.saveMap(key, map);
    expect(saveResult, true);

    final result = prefs.getMap(key);

    expect(result, isA<Map<String, dynamic>>());
    expect(result['name'], equals('Alice'));
    expect(result['age'], equals(30));
  });

  test('Retrieve non-existing map returns default', () {
    const key = 'non_existing_map';
    final defaultMap = {'fallback': true};

    final result = prefs.getMap(key, defaultValue: defaultMap);

    expect(result, equals(defaultMap));
  });
}
