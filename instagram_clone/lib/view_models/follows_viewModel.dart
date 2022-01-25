
import 'package:instagram_clone/models/MyUserData.dart';
import 'package:instagram_clone/services/user_services.dart';

class FollowsViewModel {
  Future<List<MyUserData>> getFollowers(String username) async {
    Map<String, dynamic> result = await UserService().getFollowers(username);
    return result['results'];
  }

  Future<List<MyUserData>> getFollowing(String username) async {
    Map<String, dynamic> result = await UserService().getFollowing(username);
    return result['results'];
  }

}