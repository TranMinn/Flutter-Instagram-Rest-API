import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/login_screen.dart';

class ProviderWrapper extends StatelessWidget {
  const ProviderWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   return StreamBuilder<MyUser?>(
    //       stream: AuthService().user,
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           return RootScreen();
    //         } else {
    //           return LoginScreen();
    //         }
    //       });
    // }
    return LoginScreen();
  }
}
