class Post {
  int? id;
  int? userId;
  String? title;
  String? body;

  Post({this.title, this.id, this.body, this.userId});

  factory Post.fromJson(Map<String, dynamic> map) => Post(
      id: map['id'],
      body: map['body'],
      title: map['title'],
      userId: map['userId']);

  Map<String, dynamic> toJson() => {
        'id': id,
        "userId": userId,
        "title": title,
        "body": body,
      };
}
