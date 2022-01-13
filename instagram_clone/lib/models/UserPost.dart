import 'package:cloud_firestore/cloud_firestore.dart';

class PostData {
  final String? postId;
  final String? userId;
  final String? postPhotoUrl;
  final String? caption;
  final Timestamp? time;
  final String? postOwnerName;
  final String? postOwnerPhotoUrl;
  final List? likes;

  PostData(
      {this.postId,
      this.userId,
      this.postPhotoUrl,
      this.caption,
      this.time,
      this.postOwnerName,
      this.postOwnerPhotoUrl,
      this.likes});

  factory PostData.fromJson(Map<String, dynamic> json) {
    return PostData(
        postId: json['postId'],
        userId: json['userId'],
        postPhotoUrl: json['postPhotoUrl'],
        caption: json['caption'],
        time: json['time'],
        postOwnerName: json['postOwnerName'],
        postOwnerPhotoUrl: json['postOwnerPhotoUrl'],
        likes: json['likes']);
  }
}
