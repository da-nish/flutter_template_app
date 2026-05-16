
class UserList {
    int userId;
    int id;
    String title;
    String body;

    UserList({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory UserList.fromJson(Map<String, dynamic> json) => UserList(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
