import 'package:instagram_clone/global_constants.dart';
import 'package:instagram_clone/models/MyUserData.dart';
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
  Future<MyUserData> getUserDetails(String username, String password) async {
    final responseBody =
        await ApiServices.consumeGetOneWithCre(API_USER_ME, username, password);
    return MyUserData.fromJson(responseBody);
  }

  // Get user by username
  Future<MyUserData> getUserByUsername(String username) async {
    final String api_username = '$API_USER$username/';
    final responseBody = await ApiServices.consumeGetOne(api_username);
    return MyUserData.fromJson(responseBody);
  }

  // Edit user information
  Future<MyUserData> editUserProfile(String newUsername, String fullName,
      String bio,String username, String password) async {
    Map body = {
      'username': newUsername,
      'fullname': fullName,
      'bio': bio
    };

    final responseBody =
        await ApiServices.consumePatchWithCre(API_USER_ME, body, username, password);
    return MyUserData.fromJson(responseBody);
  }

  // Edit user profile picture
  Future editUserProfilePicture(String imagePath, String username, String password) async {

    return await ApiServices.consumeUpdateWithImage(API_USER_ME, imagePath, username, password);

  }

  // Follow user
  Future<bool> followUser(String username, String currentUsername, String currentUserPassword) async {
    String api_follow = '$MAIN_URL/api/user/$username/follow';
    final response = await ApiServices.consumeGetOneWithCre(api_follow, currentUsername, currentUserPassword);
    return response['follow'];
  }

  // Get Followers
  Future<Map<String, dynamic>> getFollowers(String username) async {
    String api_followers = '$API_USER$username/get-followers';
    final responseBody = await ApiServices.consumeGetOne(api_followers);
    return responseBody;
  }

  // Get Following
  Future<Map<String, dynamic>> getFollowing(String username) async {
    String api_following = '$API_USER$username/get-following';
    final responseBody = await ApiServices.consumeGetOne(api_following);
    return responseBody;
  }
}
