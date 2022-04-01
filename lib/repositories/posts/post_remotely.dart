import 'package:dio/dio.dart';
import 'package:mvvm/model/post_model.dart';
import 'package:mvvm/repositories/posts/post_repository.dart';
import 'package:mvvm/view_model/posts/post_view_model.dart';

class PostRemotely implements PostRepository {
  @override
  Future<List<Post>> getPostById({required int id}) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getPosts() async {
    final List<Post> posts;
    var res = await Dio().get("https://jsonplaceholder.typicode.com/posts");
    final data = res.data as List;
    posts = List<Post>.from(data.map((e) => Post.fromJson(e)).toList());
    return posts;
  }
}
