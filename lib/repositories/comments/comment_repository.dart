import 'package:mvvm/model/comment_model.dart';

abstract class CommentRepository {
  Future<List<CommentModel>> getCommentsById({required int postId});
}
