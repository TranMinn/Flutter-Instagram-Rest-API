import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/models/MyUserData.dart';
import 'package:instagram_clone/models/PostData.dart';
import 'package:instagram_clone/screens/userProfile_screen.dart';
import 'package:instagram_clone/view_models/search_viewModel.dart';
import 'package:instagram_clone/widgets/loading_widget.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class SearchScreen extends StatefulWidget {
  final String currentUsername, currentUserPassword;
  const SearchScreen(
      {Key? key,
      required this.currentUsername,
      required this.currentUserPassword})
      : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchViewModel searchViewModel = SearchViewModel();
  final TextEditingController searchController = TextEditingController();
  bool showUser = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              icon: SvgPicture.asset(
                'assets/icons/search_icon.svg',
                color: Colors.black,
                width: 20,
                height: 20,
              ),
              hintText: 'Search',
              hintStyle: const TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {
                showUser = true;
              });
            },
          ),
        ),
      ),
      body: showUser
          ? FutureBuilder<MyUserData>(
              future: searchViewModel.getUserByUsername(searchController.text),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return LoadingWidget();
                }
                final searchUser = snapshot.data;
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserProfileScreen(
                              username: searchUser?.username ?? '',
                              currentUsername: widget.currentUsername,
                              currentUserPassword:
                                  widget.currentUserPassword))),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(searchUser?.profilePic ?? ''),
                      radius: 16,
                    ),
                    title: Text(searchUser?.username ?? ''),
                  ),
                );
              })
          : FutureBuilder<List<PostData>>(
              future: searchViewModel.fetchListPost,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return LoadingWidget();
                }

                final List<PostData>? listPosts = snapshot.data;
                return Container(
                  padding: EdgeInsets.only(top: 10),
                  child: StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    itemCount: listPosts?.length,
                    itemBuilder: (context, index) => Image.network(
                      listPosts?[index].photo ?? '',
                      fit: BoxFit.cover,
                    ),
                    staggeredTileBuilder: (index) => index % 7 == 0
                        ? const StaggeredTile.count(2, 2)
                        : const StaggeredTile.count(1, 1),
                  ),
                );
              }),
    );
  }
}
