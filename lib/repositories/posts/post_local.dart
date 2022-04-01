import 'package:mvvm/model/post_model.dart';
import 'package:mvvm/repositories/posts/post_repository.dart';
import 'package:mvvm/view_model/posts/post_view_model.dart';

class PostLocal implements PostRepository{
  @override
  Future<List<Post>> getPostById({required int id}) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }

}