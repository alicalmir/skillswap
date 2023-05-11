class PostModel {
  final String? id;
  final String title;
  final String body;
  final String? userId; // user ID who made the post
  final String? userName; // user name who made the post

  PostModel({
    this.id,
    required this.title,
    required this.body,
    this.userId,
    this.userName,
  });

  toJson() {
    return {
      "id": id,
      "title": title,
      "body": body,
      "userId": userId,
      "userName": userName,
    };
  }

  static PostModel fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      userId: json['userId'],
      userName: json['userName'] ?? '',
    );
  }

  PostModel copyWith({
    String? id,
    String? title,
    String? body,
    String? userId,
    String? userName,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
    );
  }
}
