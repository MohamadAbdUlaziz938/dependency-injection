import 'package:dio/dio.dart';
import 'package:mvvm/model/comment_model.dart';
import 'package:mvvm/repositories/comments/comment_repository.dart';

class CommentRemotely implements CommentRepository {
  @override
  Future<List<CommentModel>> getCommentsById({required int postId}) async {
    final List<CommentModel> comments;
    var res = await Dio().get("https://jsonplaceholder.typicode.com/comments",
        queryParameters: {"postId": postId});
    final data = res.data as List;
    comments = List<CommentModel>.from(
        data.map((e) => CommentModel.fromJson(e)).toList());
    return comments;
  }
}
