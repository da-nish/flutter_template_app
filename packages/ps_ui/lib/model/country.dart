class PSCountry {
  final String? dialCode;
  final String? flag;
  final String? name;
  late final String? code;

  PSCountry({this.dialCode, this.code, this.name, this.flag});

  PSCountry.fromJson(Map<String, dynamic> jsonMap)
      : name = jsonMap['name'],
        flag = jsonMap['flag'],
        code = jsonMap['code'],
        dialCode = jsonMap['dial_code'];
}

List<PSCountry> fromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => PSCountry.fromJson(json)).toList();
}
