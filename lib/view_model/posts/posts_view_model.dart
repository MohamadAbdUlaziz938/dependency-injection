import 'package:mvvm/repositories/posts/post_remotely.dart';
import 'package:mvvm/repositories/posts/post_repository.dart';
import 'package:mvvm/view_model/posts/post_view_model.dart';

class PostsViewMoel {
  final String title = 'All posts';
  final PostRepository _postRepository;

  PostsViewMoel({required PostRepository postRepository})
      : _postRepository = postRepository;
  List<PostViewModel> _posts = [];

  List<PostViewModel> get getPosts => _posts;

  set setPosts(List<PostViewModel> posts) {
    _posts = posts;
  }

  Future<List<PostViewModel>?> getData() async {
    try {
      final data = await PostRemotely().getPosts();
      setPosts = data.map((e) => PostViewModel(post: e)).toList();
      return _posts;
    } catch (e) {
      print(e);
    }
  }
}
