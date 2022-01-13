import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/models/User.dart';
import 'package:instagram_clone/models/UserPost.dart';
import 'package:instagram_clone/services/post_services.dart';
import 'package:instagram_clone/services/user_services.dart';

class UserProfileViewModel {

  Future<MyUserData?> fetchCurrentUser() {
    return UserService().getUserDetails();
  }

  Future<List<MyUserData>> fetchUserByUsername(String username) {
    return UserService().getUserByUsername(username);
  }


  // Stream<List<PostData>> fetchUserPosts(String userId) {
  //   return PostService().listUserPost(userId);
  // }


  Future followUser(String followedUsername) async {
    await UserService().followUser(followedUsername);
  }
}
