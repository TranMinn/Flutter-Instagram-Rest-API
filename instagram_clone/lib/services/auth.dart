import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/global_constants.dart';
import 'package:instagram_clone/models/User.dart';
import 'package:instagram_clone/services/user_services.dart';

import 'package:http/http.dart';

import 'api_services.dart';

class AuthService {


  // Register User
  Future<MyUserData> registerUser(String email, String fullName, String username, String password) async {
    return UserService().createUser(email, fullName, username, password);
  }

  // Login User
  Future<MyUserData> loginUser(String email, String password) async {

    Map body = {
      'email' : email,
      'password': password
    };
    final responseBody = await ApiServices.consumeCreate(API_LOGIN_USER, body);
    return MyUserData.fromJson(responseBody);
  }

  /////////////////////////////////////////

  // Create User object based on FirebaseUser
  final FirebaseAuth _auth = FirebaseAuth.instance;
  MyUser? _userFromFirebase(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<MyUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user!));
  }

  // // Logout
  Future logOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
