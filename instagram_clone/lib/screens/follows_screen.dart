import 'package:flutter/material.dart';
import 'package:instagram_clone/models/MyUserData.dart';
import 'package:instagram_clone/view_models/follows_viewModel.dart';

class FollowsScreen extends StatefulWidget {
  final String username;
  final int followers, following;
  const FollowsScreen(
      {Key? key,
      required this.username,
      required this.followers,
      required this.following})
      : super(key: key);

  @override
  _FollowsScreenState createState() => _FollowsScreenState();
}

class _FollowsScreenState extends State<FollowsScreen> {
  int selectedIndex = 0;
  FollowsViewModel followsViewModel = FollowsViewModel();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username, style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.5,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Center(child: Text('${widget.followers} Followers')),
                  ),
                ),
                Container(
                  width: size.width * 0.5,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      child: Center(child: Text('${widget.following} Following'))),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                height: 1,
                width: (size.width * 0.5),
                decoration: BoxDecoration(
                    color:
                        selectedIndex == 0 ? Colors.black : Colors.transparent),
              ),
              Container(
                height: 1,
                width: (size.width * 0.5),
                decoration: BoxDecoration(
                    color:
                        selectedIndex == 1 ? Colors.black : Colors.transparent),
              ),
            ],
          ),
          const SizedBox(height: 5),
          selectedIndex == 0
              ? FutureBuilder<List<MyUserData>>(
                  future: followsViewModel.getFollowers(widget.username),
                  builder: (context, snapshot) {
                    // if (!snapshot.hasData) {
                    //   return Container();
                    // }
                    if(snapshot.hasError) {
                      print(snapshot.error);
                    }
                    List<MyUserData>? listFollowers = snapshot.data;
                    return ListView.builder(
                      shrinkWrap: true,
                        itemCount: listFollowers?.length,
                        itemBuilder: (context, index) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    listFollowers?[index].profilePic ?? ''),
                                radius: 16,
                              ),
                              title: Text(listFollowers?[index].username ?? ''),
                            ));
                  })
              : FutureBuilder<List<MyUserData>>(
                  future: followsViewModel.getFollowing(widget.username),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    List<MyUserData>? listFollowing = snapshot.data;
                    return ListView.builder(
                      shrinkWrap: true,
                        itemCount: listFollowing?.length,
                        itemBuilder: (context, index) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    listFollowing?[index].profilePic ?? ''),
                                radius: 16,
                              ),
                              title: Text(listFollowing?[index].username ?? ''),
                            ));
                  }),
        ],
      ),
    );
  }
}
