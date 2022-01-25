import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/models/MyUserData.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/upload_image_screen.dart';
import 'package:instagram_clone/view_models/account_viewModel.dart';

import '../loading_widget.dart';

class AccountScreenAppBar extends StatelessWidget {
  final String username, password;
  const AccountScreenAppBar(
      {Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountViewModel accountViewModel = AccountViewModel();
    return FutureBuilder<MyUserData?>(
        future: accountViewModel.fetchCurrentUserData(username, password),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingWidget();
          } else {
            MyUserData? myUserData = snapshot.data;
            return AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 0, 3, 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${myUserData!.username}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const Icon(Icons.keyboard_arrow_down,
                              color: Colors.black)
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UploadImageScreen(
                                            username: username,
                                            password: password,
                                          )));
                            },
                            child: SvgPicture.asset(
                              "assets/icons/upload_icon.svg",
                              width: 26,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            child: SvgPicture.asset(
                              "assets/icons/menu_icon.svg",
                              width: 26,
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () async {
                                        Navigator.pop(context);
                                        // await AccountViewModel()
                                        //     .logOut()
                                        //     .then((value) => Navigator.push(
                                        //         context,
                                        //         MaterialPageRoute(
                                        //             builder: (context) =>
                                        //                 LoginScreen())));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()));

                                        print('Logged out');
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 60),
                                        child: const Text('Log out'),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
