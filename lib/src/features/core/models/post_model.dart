class PostModel {
  final String id;
  final String title;
  final String body;

  PostModel(this.id, this.title, this.body);

  toJson() {
    return {
      "Id": id,
      "Title": title,
      "Body": body,
    };
  }
}
