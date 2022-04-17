import 'package:flutter/material.dart';
import 'package:mvvm/model/comment_model.dart';
import 'package:mvvm/repositories/comments/comment_remotely.dart';
import 'package:mvvm/view/posts/post_view.dart';
import 'package:mvvm/view_model/comments_view_model.dart';
import 'package:provider/provider.dart';

class CommentsView extends StatefulWidget {
  const CommentsView({Key? key}) : super(key: key);

  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('all comments'),
        ),
        body: ChangeNotifierProvider(
          key: ValueKey("value"),
          create: (context) =>
              CommentsViewModel(commentRepository: CommentRemotely()),
          builder: (context, child) {
            return FutureBuilder<List<CommentModel>?>(
              builder: (context, AsyncSnapshot<List<CommentModel>?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return CommentItem(
                        commentModel: snapshot.data![index],
                      );
                    },
                    padding: const EdgeInsets.all(10),
                    itemCount: snapshot.data?.length,
                    cacheExtent: 300,
                  );
                }
                return const Text('no result');
              },
              future: Provider.of<CommentsViewModel>(context)
                  .getComments(postId: 1),
            );
          },
        ));
  }
}
