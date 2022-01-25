import 'dart:io';

import 'package:instagram_clone/global_constants.dart';
import 'package:instagram_clone/models/MyUserData.dart';
import 'package:instagram_clone/models/PostData.dart';

import 'package:instagram_clone/services/api_services.dart';

class PostService {
  // Upload a post
  // photo has type File
  Future<PostData> uploadPost(String imagePath, text, username, password) async {

    final responseBody = await ApiServices.consumeCreateWithImage(API_POST, text, imagePath, username, password);
    return PostData.fromJson(responseBody);

  }

  // Get all posts
  Future<List<PostData>> getListPosts() async {
    final responseBody = await ApiServices.consumeGetAll(API_POST);
    List<PostData> listPosts = (responseBody['results'] as List)
        .map((item) => PostData.fromJson(item))
        .toList();
    return listPosts;
  }

  // Get list of feed posts
  Future<List<PostData>> getListFeedPosts(String username, String password) async {
    final responseBody = await ApiServices.consumeGetOneWithCre(API_POST, username, password);
    List<PostData> listPosts = (responseBody['results'] as List)
        .map((item) => PostData.fromJson(item))
        .toList();
    return listPosts;
  }

  // Upload a comment
  Future<Post_comments> uploadPostComment(
      String postId, String text, username, password) async {
    String apiUrl = '$API_COMMENT$postId/';
    Map body = {
      'text': text,
    };

    final responseBody = await ApiServices.consumeCreateWithCre(
        apiUrl, body, username, password);
    return Post_comments.fromJson(responseBody);
  }

  // Get post comments
  Future<List<Post_comments>> getPostComments(String postId) async {
    String apiUrl = '$API_POST$postId/';
    final responseBody = await ApiServices.consumeGetAll(apiUrl);
    List<Post_comments> listPostComments =
        (responseBody['post_comments'] as List)
            .map((item) => Post_comments.fromJson(item))
            .toList();
    return listPostComments;
  }

  // Get post by id
  Future<PostData> getPostById(String postId) async {
    final String apiUrl = '$API_POST$postId/';

    final responseBody = await ApiServices.consumeGetOne(apiUrl);
    return PostData.fromJson(responseBody);
  }

  // Like post
  Future<bool> likePost(String postId, String username, String password) async {
    final String apiUrl = '$API_LIKE$postId';

    final response =
        await ApiServices.consumeGetOneWithCre(apiUrl, username, password);
    return response['like'];
  }

  // Get likers
  Future<List<MyUserData>> getLikers(String postId) async {
    final String apiUrl = '$API_POST$postId/get-likers/';

    final response = await ApiServices.consumeGetOne(apiUrl);
    List<MyUserData> listLikers = (response['results'] as List).map((user) => MyUserData.fromJson(user)).toList();
    return listLikers;
  }
}
