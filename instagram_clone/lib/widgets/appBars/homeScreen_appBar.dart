import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/screens/upload_image_screen.dart';

class HomeScreenAppBar extends StatelessWidget {
  final String username, password;
  const HomeScreenAppBar({Key? key, required this.username, required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: const Text(
        "Instagram",
        style: TextStyle(
            fontFamily: 'Signatra', fontSize: 33, color: Colors.black),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return UploadImageScreen(username: username, password: password,);
                },
              ),
            );
          },
          child: SvgPicture.asset(
            "assets/icons/upload_icon.svg",
            width: 26,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            "assets/icons/messenger_icon.svg",
            width: 26,
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
