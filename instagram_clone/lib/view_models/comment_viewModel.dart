import 'package:instagram_clone/models/PostData.dart';
import 'package:instagram_clone/services/post_services.dart';

class CommentViewModel {
  Future uploadComment(String postId, String text, String username, String password) async {
    await PostService().uploadPostComment(postId, text, username, password);
  }

  Future<List<Post_comments>> fetchListPostComment(String postId) async {
    return await PostService().getPostComments(postId);
  }

}