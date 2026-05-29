import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ps_db/core/shared_preference.dart';


void main() {
  late PSPreferences prefs;

  setUp(() async {
    // Setup mock initial values
    // SharedPreferences.setMockInitialValues({});
    prefs = PSPreferences();
    // await prefs.init();
  });

  test('Save and retrieve encrypted string', () async {
    const key = 'test_string';
    const value = 'hello_encrypted';

    await prefs.saveString(key, value);

    final result = await prefs.getString(key);
    expect(result, value);
  });

  test('Save and retrieve encrypted int', () async {
    const key = 'test_int';
    const value = 1234;

    await prefs.saveInt(key, value);

    final result = prefs.getInt(key);
    expect(result, value);
  });

  test('Save and retrieve encrypted boolean', () async {
    const key = 'test_bool';
    const value = true;

    await prefs.saveBoolean(key, value);

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

    expect(prefs.containsKey(key), true);
    expect(prefs.containsKey('non_exist_key'), false);
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

    expect(prefs.containsKey('key1'), false);
    expect(prefs.containsKey('key2'), false);
    expect(prefs.containsKey('key3'), false);
  });

  test('SaveMap ', () async {
    final Map dd = {"a": "b", "c": 1};
    await prefs.saveMap('key11', dd);
    final s = prefs.getMap('key11');

    debugPrint("res:1: $s");
  });

  test('Save and retrieve encrypted map', () async {
    const key = 'test_map';
    final map = {'name': 'Alice', 'age': 30};

    await prefs.saveMap(key, map);

    final result = await prefs.getMap(key);

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
