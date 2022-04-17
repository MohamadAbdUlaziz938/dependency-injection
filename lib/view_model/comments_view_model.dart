import 'package:flutter/cupertino.dart';
import 'package:mvvm/model/comment_model.dart';
import 'package:mvvm/repositories/comments/comment_repository.dart';

class CommentsViewModel with ChangeNotifier {
  CommentRepository commentRepository;
  String? value;

  CommentsViewModel({required this.commentRepository});

  Future<List<CommentModel>?> getComments({required int postId}) async {
    try {
      if (value == null) {
        final data = await commentRepository.getCommentsById(postId: postId);
        value = "mohamad";
        return data;
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose comments");
  }
  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
    super.addListener(listener);
    print("listener");
  }
}
