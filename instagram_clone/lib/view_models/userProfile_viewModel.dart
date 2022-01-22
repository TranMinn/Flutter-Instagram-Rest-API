import 'package:instagram_clone/models/MyUserData.dart';
import 'package:instagram_clone/services/user_services.dart';

class UserProfileViewModel {

  Future<MyUserData?> fetchCurrentUser(String username, String password) {
    return UserService().getUserDetails(username, password);
  }

  Future<MyUserData> fetchUserByUsername(String username) {
    return UserService().getUserByUsername(username);
  }

  // Stream<List<PostData>> fetchUserPosts(String userId) {
  //   return PostService().listUserPost(userId);
  // }

  Future<bool> followUser(String followedUsername, String currentUsername, String currentUserPassword) async {
    return await UserService().followUser(followedUsername, currentUsername, currentUserPassword);
  }
}
