
class TestModel {
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  TestModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
