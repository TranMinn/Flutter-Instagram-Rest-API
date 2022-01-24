import 'dart:io';

import 'package:instagram_clone/global_constants.dart';
import 'package:instagram_clone/models/MyUserData.dart';
import 'package:instagram_clone/models/PostData.dart';

import 'package:instagram_clone/services/api_services.dart';

class PostService {
  // Upload a post
  // photo has type File
  Future<PostData> uploadPost(File image, text, username, password) async {

    String fileName = image.path.split('/').last;

    Map body = {
      'photo': 'http://192.168.50.33:8000/api/post/$fileName',
      'text': text,
    };

    final responseBody = await ApiServices.consumeCreateWithCre(
        API_POST, body, username, password);

    return PostData.fromJson(responseBody);

    // final responseBody = await ApiServices.consumeCreateWithImage(API_POST, text, image, username, password);
    // return PostData.fromJson(responseBody);

    // Map body = {
    //   'text': text,
    //   'photo': image != null ? base64Encode(image.readAsBytesSync()) : ''
    // };
    //
    // final responseBody = await ApiServices.consumeCreateWithCre(
    //     API_POST, body, username, password);
    //
    // return PostData.fromJson(responseBody);
  }

  // Get list posts feed
  Future<List<PostData>> getListPosts() async {
    final responseBody = await ApiServices.consumeGetAll(API_POST);
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
  Future<MyUserData> getLikers(String postId) async {
    final String apiUrl = '$API_POST$postId/get-likers/';

    final response = await ApiServices.consumeGetOne(apiUrl);
    return MyUserData.fromJson(response['results']);
  }
}
