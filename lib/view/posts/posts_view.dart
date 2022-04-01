import 'package:flutter/material.dart';
import 'package:mvvm/repositories/posts/post_remotely.dart';
import 'package:mvvm/view/posts/post_item.dart';
import 'package:mvvm/view_model/posts/post_view_model.dart';
import 'package:mvvm/view_model/posts/posts_view_model.dart';

class PostsView extends StatefulWidget {
  PostsView({Key? key}) : super(key: key);

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  final PostsViewMoel postsViewMoel =
      PostsViewMoel(postRepository: PostRemotely());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(postsViewMoel.title),
        ),
        body: FutureBuilder<List<PostViewModel>?>(
          builder: (context, AsyncSnapshot<List<PostViewModel>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return PostItem(
                    postViewModel: snapshot.data![index],
                  );
                },
                padding: const EdgeInsets.all(10),
                itemCount: snapshot.data?.length,
              );
            }
            return const Text('no result');
          },
          future: postsViewMoel.getData(),
        ));
  }
}


