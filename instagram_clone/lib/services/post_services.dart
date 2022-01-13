import 'package:instagram_clone/global_constants.dart';
import 'package:instagram_clone/models/PostComment.dart';
import 'package:instagram_clone/models/UserPost.dart';
import 'package:instagram_clone/models/User.dart';

import 'package:instagram_clone/services/api_services.dart';

class PostService {

  // Upload a post
  Future<PostData> uploadPost(
      MyUserData myUserData, postPhotoUrl, caption) async {
    Map body = {
      'userId': myUserData.userId,
      'postPhotoUrl': postPhotoUrl,
      'caption': caption,
      'time': DateTime.now(),
      'postOwnerName': myUserData.username,
      'postOwnerPhotoUrl': myUserData.profile_pic
    };

    final responseBody = await ApiServices.consumeCreate(API_POST, body);
    return PostData.fromJson(responseBody);
  }

  // Get list posts feed
  Future<List<PostData>> getListPosts() async {
    final responseBody = await ApiServices.consumeGetAll(API_FEED);
    List<PostData> listPosts =
        responseBody.map((dynamic item) => PostData.fromJson(item)).toList();
    return listPosts;
  }

  // Upload a comment
  Future<PostComment> uploadPostComment(
      MyUserData myUserData, String postId, String text) async {
    String api_comment = '$MAIN_URL/$postId';
    Map body = {
      'postId': postId,
      'text': text,
      'username': myUserData.username,
      'userPhotoUrl': myUserData.profile_pic,
      'time': DateTime.now()
    };

    final responseBody = await ApiServices.consumeCreate(api_comment, body);
    return PostComment.fromJson(responseBody);
  }

  // Get post comments
  Future<List<PostComment>> getPostComments(String postId) async {
    String api_comment = '$MAIN_URL/$postId';
    final responseBody = await ApiServices.consumeGetAll(api_comment);
    List<PostComment> listPostComments =
        responseBody.map((dynamic item) => PostComment.fromJson(item)).toList();
    return listPostComments;
  }

  // Get user posts

  // Get post by id
  Future<PostData> getPostById(String postId) async {
    final String api_post = '$MAIN_URL/api/post/$postId';
    final responseBody = await ApiServices.consumeGetOne(api_post);
    return PostData.fromJson(responseBody);
  }

  // Like post
  Future likePost(String postId, String userId, List likes) async {
    final String api_like = '$API_LIKE/$postId';

    Map body = {'postId': postId, 'userId': userId, 'likes': likes};

    await ApiServices.consumeCreate(api_like, body);
  }
}
