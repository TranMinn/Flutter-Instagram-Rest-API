
import 'package:instagram_clone/models/MyUserData.dart';
import 'package:instagram_clone/services/post_services.dart';

class PostTileViewModel {

  Future<bool> likePost(String postId, String username, String password) async {
    return await PostService().likePost(postId, username, password);
  }

  Future<List<MyUserData>> getLikers(String postId) async {
    return await PostService().getLikers(postId);
  }

}