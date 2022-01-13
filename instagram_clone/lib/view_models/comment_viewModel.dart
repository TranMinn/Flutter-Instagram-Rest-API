
import 'package:instagram_clone/models/PostComment.dart';
import 'package:instagram_clone/models/User.dart';
import 'package:instagram_clone/services/post_services.dart';

class CommentViewModel {
  Future uploadComment(MyUserData myUserData, String postId, String text) async {
    await PostService().uploadPostComment(myUserData, postId, text);
  }

  Future<List<PostComment>> fetchListPostComment(String postId) async {
    return await PostService().getPostComments(postId);
  }

}