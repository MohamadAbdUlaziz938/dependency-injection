import 'package:mvvm/model/post_model.dart';

class PostViewModel {
  final Post _post;

  PostViewModel({required Post post}) : _post = post;

  Post get post => _post;

  int? get id => _post.id;

  int? get userId => _post.id;

  String? get title => _post.title;

  String? get body => _post.body;
}
