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
  final VisibilityCondition? visibilityConditions;

  SectionModel({
    required this.id,
    required this.type,
    required this.style,
    required this.required,
    required this.content,
    required this.isInputType,
    this.visibilityConditions,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      id: json['id'],
      type: json['type'],
      style: json['style'],
      required: json['required'] ?? false,
      isInputType: json['is_input'] ?? false,
      content: json['content'] ?? [],
      visibilityConditions: json['visibilityConditions'] != null
          ? VisibilityCondition.fromJson(json['visibilityConditions'])
          : null,
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

class VisibilityCondition {
  final String? operator;
  final String? field;
  final dynamic value;
  final List<VisibilityCondition> conditions;

  VisibilityCondition({
    this.operator,
    this.field,
    this.value,
    this.conditions = const [],
  });

  factory VisibilityCondition.fromJson(Map<String, dynamic> json) {
    final rulesJson = json['rules'] ?? json['conditions'];
    return VisibilityCondition(
      operator: json['operator'],
      field: json['field'],
      value: json['value'],
      conditions: (rulesJson as List?)
              ?.map((e) => VisibilityCondition.fromJson(e))
              .toList() ??
          [],
    );
  }

  bool evaluate(Map<String, dynamic> formData) {
    if (field != null) {
      final fieldValue = formData[field];
      final valStr = fieldValue?.toString() ?? '';
      final expectedStr = value?.toString() ?? '';

      switch (operator?.toLowerCase()) {
        case 'equals':
        case '==':
          return valStr == expectedStr;
        case 'notequals':
        case '!=':
          return valStr != expectedStr;
        case 'contains':
          return valStr.contains(expectedStr);
        default:
          return valStr == expectedStr;
      }
    }

    if (conditions.isNotEmpty) {
      if (operator?.toUpperCase() == 'OR') {
        return conditions.any((c) => c.evaluate(formData));
      } else {
        // default to AND
        return conditions.every((c) => c.evaluate(formData));
      }
    }
    return true;
  }
}