class PostModel {
  final String id;
  final String title;
  final String body;

  PostModel({required this.id, required this.title, required this.body});

  toJson() {
    return {
      "Id": id,
      "Title": title,
      "Body": body,
    };
  }

  static PostModel fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['Id'],
      title: json['Title'],
      body: json['Body'],
    );
  }

  PostModel copyWith({String? id, String? title, String? body}) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
