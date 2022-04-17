import 'package:flutter/material.dart';
import 'package:mvvm/repositories/posts/post_remotely.dart';
import 'package:mvvm/view/posts/posts_view.dart';
import 'package:mvvm/view_model/posts/posts_view_model.dart';
import 'package:provider/provider.dart';

class PostAssistant extends StatelessWidget {
  const PostAssistant({Key? key}) : super(key: key);
  static const rout = "postsView";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PostsViewMoel(postRepository: PostRemotely()),
        child: PostsView(
        ));
  }
}
