import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/models/MyUserData.dart';
import 'package:instagram_clone/models/PostData.dart';
import 'package:instagram_clone/screens/comment_screen.dart';
import 'package:instagram_clone/screens/likes_screen.dart';
import 'package:instagram_clone/screens/userProfile_screen.dart';
import 'package:instagram_clone/view_models/postTile_viewModel.dart';
import 'package:instagram_clone/view_models/account_viewModel.dart';

class PostTile extends StatefulWidget {
  final PostData post;
  final String username, password;
  const PostTile(
      {Key? key,
      required this.post,
      required this.username,
      required this.password})
      : super(key: key);

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  PostTileViewModel postTileViewModel = PostTileViewModel();
  AccountViewModel accountViewModel = AccountViewModel();

  bool isLiked = false;
  late bool liked;
  late int noOfLikes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    noOfLikes = widget.post.numberOfLikes!;
    // isLiked = widget.post.likedByReqUser!;
  }

  @override
  Widget build(BuildContext context) {
    PostData widgetPost = widget.post;
    return FutureBuilder<MyUserData?>(
        future: accountViewModel.fetchCurrentUserData(
            widget.username, widget.password),
        builder: (context, snapshot) {
          // int? currentUserId = snapshot.data?.id;

          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserProfileScreen(
                                      username: widgetPost.author!.username!,
                                      currentUsername: widget.username,
                                      currentUserPassword: widget.password)));
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      widgetPost.author!.profilePic!),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              widgetPost.author!.username!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/icons/menu_vertical.png',
                        width: 30,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widgetPost.photo ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            splashRadius: 25,
                            onPressed: () async {
                              liked = await postTileViewModel.likePost(
                                  widgetPost.id!,
                                  widget.username,
                                  widget.password);

                              setState(() {
                                isLiked = liked;
                                isLiked ? noOfLikes++ : noOfLikes--;
                              });
                            },
                            icon: isLiked
                                ? SvgPicture.asset(
                                    'assets/icons/loved_icon.svg')
                                : SvgPicture.asset('assets/icons/love_icon.svg',
                                    width: 40,
                                    height: 40,
                                    color: Colors.black87),
                          ),
                          IconButton(
                            splashRadius: 25,
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CommentScreen(
                                    postData: widgetPost,
                                    username: widget.username,
                                    password: widget.password,
                                  ),
                                )),
                            icon: Image.asset(
                              'assets/icons/comment_icon.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          IconButton(
                            splashRadius: 25,
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/icons/share_icon.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        splashRadius: 25,
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/bookmark_icon.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LikesScreen(
                                      postId: widgetPost.id!,
                                    ))),
                        child: Text(
                          '$noOfLikes likes',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text.rich(TextSpan(
                        children: [
                          TextSpan(
                            text: widgetPost.author!.username,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: ' '),
                          TextSpan(
                              text: widgetPost.text,
                              style: const TextStyle(height: 1.5)),
                        ],
                      )),
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentScreen(
                                postData: widgetPost,
                                username: widget.username,
                                password: widget.password,
                              ),
                            )),
                        child: const Text(
                          'View all comments',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
