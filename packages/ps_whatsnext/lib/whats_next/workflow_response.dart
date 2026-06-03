class WorkflowResponse {
  final double? progress;
  final DynamicTable? table;
  final List<WorkflowStep> steps;

  WorkflowResponse({
    this.progress,
    this.table,
    required this.steps,
  });

  factory WorkflowResponse.fromJson(Map<String, dynamic> json) {
    return WorkflowResponse(
      progress: json['progress'],
      table: json["table"] != null
          ? DynamicTable.fromJson(json["table"])
          : null,
      steps: (json["steps"] as List)
          .map((e) => WorkflowStep.fromJson(e))
          .toList(),
    );
  }
}


class DynamicTable {
  final String title;
  final String subtitle;
  final List<TableRowItem> rows;

  DynamicTable({
    required this.title,
    required this.subtitle,
    required this.rows,
  });

  factory DynamicTable.fromJson(Map<String, dynamic> json) {
    return DynamicTable(
      title: json["title"] ?? "",
      subtitle: json["subtitle"] ?? "",
      rows: (json["rows"] as List)
          .map((e) => TableRowItem.fromJson(e))
          .toList(),
    );
  }
}


class TableRowItem {
  final String key;
  final List<ContentItem> value;

  TableRowItem({
    required this.key,
    required this.value,
  });

  factory TableRowItem.fromJson(Map<String, dynamic> json) {
    return TableRowItem(
      key: json["key"] ?? "",
      value: (json["value"] as List)
          .map((e) => ContentItem.fromJson(e))
          .toList(),
    );
  }
}



class WorkflowStep {
  final String id;
  final String title;
  final bool expanded;
  final String status;

  final List<ContentItem> description;
  final List<ActionButton> buttons;
  final List<ContentItem> note;

  WorkflowStep({
    required this.id,
    required this.title,
    required this.expanded,
    required this.status,
    required this.description,
    required this.buttons,
    required this.note,
  });

  factory WorkflowStep.fromJson(Map<String, dynamic> json) {
    return WorkflowStep(
      id: json["id"],
      title: json["title"],
      expanded: json["expanded"] ?? false,
      status: json["status"] ?? "inactive",
      description: (json["description"] as List? ?? [])
          .map((e) => ContentItem.fromJson(e))
          .toList(),
      buttons: (json["buttons"] as List? ?? [])
          .map((e) => ActionButton.fromJson(e))
          .toList(),
      note: (json["note"] as List? ?? [])
          .map((e) => ContentItem.fromJson(e))
          .toList(),
    );
  }
}



class ContentItem {
  final String type;
  final String text;
  final ActionModel? action;

  ContentItem({
    required this.type,
    required this.text,
    this.action,
  });

  factory ContentItem.fromJson(Map<String, dynamic> json) {
    return ContentItem(
      type: json["type"] ?? "",
      text: json["text"] ?? "",
      action: json["action"] != null
          ? ActionModel.fromJson(json["action"])
          : null,
    );
  }
}


class ActionButton {
  final String text;
  final String style;
  final bool enabled;
  final ActionModel action;

  ActionButton({
    required this.text,
    required this.style,
    required this.enabled,
    required this.action,
  });

  factory ActionButton.fromJson(Map<String, dynamic> json) {
    return ActionButton(
      text: json["text"],
      style: json["style"],
      enabled: json["enabled"] ?? true,
      action: ActionModel.fromJson(json["action"]),
    );
  }
}


class ActionModel {
  final String type;

  final String? route;
  final String? id;

  ActionModel({
    required this.type,
    this.route,
    this.id,
  });

  factory ActionModel.fromJson(Map<String, dynamic> json) {
    return ActionModel(
      type: json["type"],
      route: json["route"],
      id: json["id"],
    );
  }
}