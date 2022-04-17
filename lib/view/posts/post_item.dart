import 'package:flutter/material.dart';
import 'package:mvvm/view/posts/post_view.dart';
import 'package:mvvm/view_model/posts/post_view_model.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key? key, required this.postViewModel}) : super(key: key);
  final PostViewModel postViewModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(PostView.rout, arguments: postViewModel.id);
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => PostView(),
        // ));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black12,
              ),
              SizedBox(
                width: 30,
              ),
              Text(postViewModel.userId.toString()),
            ],
          ),
          ListTile(
            title: Text(postViewModel.title ?? ''),
            subtitle: Text(postViewModel.body ?? ''),
          ),
          const Divider()
        ],
      ),
    );
  }
}
