import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/UserPost.dart';

class PostComment {
  final String? postId;
  final String? userId;
  final String? username;
  final String? userPhotoUrl;
  final String? text;
  final Timestamp? time;

  PostComment(
      {this.postId,
      this.userId,
      this.username,
      this.userPhotoUrl,
      this.text,
      this.time});

  factory PostComment.fromJson(Map<String, dynamic> json) {
    return PostComment(
      postId: json['postId'],
      userId: json['userId'],
      username: json['username'],
      userPhotoUrl: json['userPhotoUrl'],
      text: json['text'],
      time: json['time'],
    );
  }
}
