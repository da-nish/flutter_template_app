class DynamicScreenModel {
  final String screenTitle;
  final List<SectionModel> sections;

  DynamicScreenModel({
    required this.screenTitle,
    required this.sections,
  });

  factory DynamicScreenModel.fromJson(Map<String, dynamic> json) {
    return DynamicScreenModel(
      screenTitle: json['screenTitle'] ?? '',
      sections: (json['sections'] as List)
          .map((e) => SectionModel.fromJson(e))
          .toList(),
    );
  }
}

class SectionModel {
  final String id;
  final String type;
  final String style;
  final bool required;
  final bool isInputType;
  final List<dynamic> content;

  SectionModel({
    required this.id,
    required this.type,
    required this.style,
    required this.required,
    required this.content,
    required this.isInputType,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      id: json['id'],
      type: json['type'],
      style: json['style'],
      required: json['required'] ?? false,
      isInputType: json['is_input'] ?? false,
      content: json['content'] ?? [],
    );
  }
}


class DynamicSelectConfig {
  final String title;
  final String placeholder;
  final String endpoint;

  DynamicSelectConfig({
    required this.title,
    required this.placeholder,
    required this.endpoint,
  });

  factory DynamicSelectConfig.fromJson(Map<String, dynamic> json) {
    return DynamicSelectConfig(
      title: json['title'] ?? '',
      placeholder: json['placeholder'] ?? '',
      endpoint: json['endpoint'] ?? '',
    );
  }
}