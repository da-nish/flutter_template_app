
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



class UserModel {
    String userId;
    String id;
    String title;
    String body;

    UserModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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



class ClientModel {
  String? tokenType;
  int? expiresIn;
  String? accessToken;

  ClientModel({this.tokenType, this.expiresIn, this.accessToken});

  ClientModel.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['access_token'] = accessToken;
    return data;
  }
}
