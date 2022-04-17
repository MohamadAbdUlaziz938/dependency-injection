import 'package:flutter/material.dart';
import 'package:mvvm/view/posts/post_item.dart';
import 'package:mvvm/view_model/posts/post_view_model.dart';
import 'package:mvvm/view_model/posts/posts_view_model.dart';
import 'package:provider/provider.dart';

class PostsView extends StatefulWidget {
  PostsView({
    Key? key,
  }) : super(key: key);

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  @override
  void initState() {
    print("init");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Provider.of<PostsViewMoel>(context).title),
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
                cacheExtent: 300,
              );
            }
            return const Text('no result');
          },
          future: Provider.of<PostsViewMoel>(context).getData(),
        ));
  }
}
