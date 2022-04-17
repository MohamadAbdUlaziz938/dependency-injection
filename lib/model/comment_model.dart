class CommentModel {
  int postId;
  int id;
  String name;
  String body;

  CommentModel(
      {required this.id,
      required this.name,
      required this.body,
      required this.postId});

  factory CommentModel.fromJson(Map<String, dynamic> map) => CommentModel(
      id: map["id"],
      name: map["name"],
      body: map["body"],
      postId: map["postId"]);
}
