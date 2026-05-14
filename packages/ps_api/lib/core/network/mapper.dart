import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ps_api/core/models/response_wrapper.dart';

class MapperFactory {
  static void initialize() {
    // ModelRegister.registerModelClasses();
  }

  static ApiResponseWrapper<D>? map<T, D>(
      Response response, Function(dynamic) parser,
      [bool overrideModel = false]) {
    assert(
      // ignore: unnecessary_null_comparison
      parser != null,
      "A proper constructor callback must be registered for all api model classes. Couldn't find registry for $T",
    );
    final json = response.data;

    final bool isListType = (json is List) ? true : false;
    if (json == null) return null;

    // debugPrint(">>> debug: $T");
    // debugPrint(">>> debug: ${parser.toString()}");

    return ApiResponseWrapper<D>.from(
      responseStatus: overrideModel
          ? isListType
              ? ""
              : json['error'] != null
                  ? "500"
                  : (json['responseStatus'] != null
                      ? (json['responseStatus'] ?? "").toString()
                      : "")
          : (json['responseStatus'] != null
              ? (json['responseStatus'] ?? "").toString()
              : ""),
      responseCode: overrideModel
          ? isListType
              ? ""
              : ""
          : json['responseCode'],
      responseHttpCode: overrideModel
          ? isListType
              ? response.statusCode
              : json['error'] != null
                  ? 500
                  : json['responseHttpCode']
          : json['responseHttpCode'],
      data: overrideModel
          ? (json != null && json.length > 0)
              ? json.map<T>((e) => (parser(e) as T)).toList()
              : parser(json) as T
          : (json['response'] != null &&
                  json['response']['data'] != null &&
                  json['response']['data'] is List)
              ? (json['response']['data'] as List)
                  .map((e) => parser(e) as T)
                  .toList()
                  .cast<T>()
              : parser((json['response'] != null
                  ? (json['response']['data'] ?? jsonDecode("{}"))
                  : jsonDecode("{}"))) as T,
      message: overrideModel
          ? isListType
              ? []
              : json['error'] != null
                  ? ([json['message'] ?? json['error_description']])
                  : (json['response'] != null
                      ? (json['response']['message'] ?? []).cast<String>()
                      : [])
          : (json['response'] != null
              ? (json['response']['message'] ?? []).cast<String>()
              : []),
      statusCode: response.statusCode,
    );
  }
}
