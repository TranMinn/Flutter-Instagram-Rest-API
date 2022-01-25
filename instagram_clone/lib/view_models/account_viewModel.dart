import 'package:instagram_clone/models/MyUserData.dart';
import 'package:instagram_clone/services/user_services.dart';

class AccountViewModel {
  // final currentUserId = FirebaseAuth.instance.currentUser?.uid;

  Future<MyUserData?> fetchCurrentUserData(String username, String password) {
    return UserService().getUserDetails(username, password);
  }

  Future<Map<String, dynamic>> fetchFollowers(String username) async {
    return UserService().getFollowers(username);
  }

  Future<Map<String, dynamic>> fetchFollowing(String username) async {
    return UserService().getFollowing(username);
  }

  // Stream<List<PostData>> fetchUserPost() {
  //   return PostService().listUserPost(currentUserId!);
  // }

  // Future logOut() async {
  //   return await AuthService().logOut();
  // }
}
