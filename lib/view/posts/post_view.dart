import 'package:flutter/material.dart';
import 'package:mvvm/model/comment_model.dart';
import 'package:mvvm/repositories/comments/comment_remotely.dart';
import 'package:mvvm/view_model/comments_view_model.dart';
import 'package:provider/provider.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key, required this.postId}) : super(key: key);
  static const rout = "postView";
  final int postId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("post view"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => CommentsViewModel(commentRepository: CommentRemotely()),
        builder: (context, child) {
          return FutureBuilder(
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
                .getComments(postId: postId),
          );
        },
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  const CommentItem({Key? key, required this.commentModel}) : super(key: key);
  final CommentModel commentModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(commentModel.name),
      subtitle: Text(commentModel.body),
    );
  }
}
