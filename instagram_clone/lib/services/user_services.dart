import 'package:instagram_clone/global_constants.dart';
import 'package:instagram_clone/models/User.dart';
import 'package:instagram_clone/services/api_services.dart';

class UserService {
  final String? uid;
  UserService({this.uid});

  // Create user
  Future<MyUserData> createUser(
      String email, String fullName, String username, String password) async {
    Map body = {
      'email': email,
      'fullname': fullName,
      'username': username,
      'password': password
    };

    final responseBody =
        await ApiServices.consumeCreate(API_REGISTER_USER, body);
    return MyUserData.fromJson(responseBody);
  }

  // Get current user
  Future<MyUserData> getUserDetails() async {
    final responseBody = await ApiServices.consumeGetOne(API_USER_ME);
    return MyUserData.fromJson(responseBody);
  }

  // Get list users by username
  Future<List<MyUserData>> getUserByUsername(String username) async {
    final String api_username = '$API_USERNAME/$username';
    final responseBody = await ApiServices.consumeGetAll(api_username);
    List<MyUserData> listUsers =
        responseBody.map((dynamic item) => MyUserData.fromJson(item)).toList();
    return listUsers;
  }

  // Edit user
  Future<MyUserData> editUserProfile(
      String username, String fullName, String bio, String photoUrl) async {
    Map body = {
      'username': username,
      'fullname': fullName,
      'bio': bio,
      'photoUrl': photoUrl
    };

    final responseBody = await ApiServices.consumeUpdate(API_USER_ME, body);
    return MyUserData.fromJson(responseBody);
  }

  // Follow user
  Future followUser(String username) async {
    String api_follow = '$MAIN_URL/api/user/$username/follow';
    await ApiServices.consumeGetOne(api_follow);
  }

  // Get Followers
  Future<Map<String, dynamic>> getFollowers(String username) async {
    String api_followers = '$MAIN_URL/api/user/$username/get-followers';
    final responseBody = await ApiServices.consumeGetOne(api_followers);
    return responseBody;
  }

  // Get Following
  Future<Map<String, dynamic>> getFollowing(String username) async {
    String api_following = '$MAIN_URL/api/user/$username/get-following';
    final responseBody = await ApiServices.consumeGetOne(api_following);
    return responseBody;
  }
}
