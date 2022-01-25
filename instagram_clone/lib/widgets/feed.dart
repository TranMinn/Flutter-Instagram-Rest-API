import 'package:flutter/material.dart';
import 'package:instagram_clone/models/PostData.dart';
import 'package:instagram_clone/view_models/feed_viewModel.dart';
import 'package:instagram_clone/widgets/loading_widget.dart';
import 'package:instagram_clone/widgets/post_tile.dart';

class Feed extends StatefulWidget {
  final String username, password;
  const Feed({Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  FeedViewModel feedViewModel = FeedViewModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostData>>(
        future: feedViewModel.fetchListFeedPosts(widget.username, widget.password),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
            return LoadingWidget();
          } else {
            final posts = snapshot.data;

            return ListView.builder(
                itemCount: posts?.length,
                itemBuilder: (context, index) {
                  return PostTile(
                    post: posts?[index] ?? new PostData(),
                    username: widget.username,
                    password: widget.password,
                  );
                });
          }
        });
  }
}
