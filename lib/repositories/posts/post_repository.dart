import 'package:mvvm/model/post_model.dart';
import 'package:mvvm/view_model/posts/post_view_model.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();

  Future<List<Post>> getPostById({required int id});
}
