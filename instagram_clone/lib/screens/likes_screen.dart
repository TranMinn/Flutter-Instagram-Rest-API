import 'package:flutter/material.dart';
import 'package:instagram_clone/models/MyUserData.dart';
import 'package:instagram_clone/view_models/postTile_viewModel.dart';

class LikesScreen extends StatefulWidget {
  final String postId;
  const LikesScreen({Key? key, required this.postId}) : super(key: key);

  @override
  _LikesScreenState createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Likes', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
      ),
      body: FutureBuilder<List<MyUserData>>(
          future: PostTileViewModel().getLikers(widget.postId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }

            List<MyUserData>? listLikers = snapshot.data;
            return ListView.builder(
              shrinkWrap: true,
                itemCount: listLikers?.length,
                itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(listLikers?[index].profilePic ?? ''),
                        radius: 16,
                      ),
                      title: Text(listLikers?[index].username ?? ''),
                    ));
          }),
    );
  }
}
