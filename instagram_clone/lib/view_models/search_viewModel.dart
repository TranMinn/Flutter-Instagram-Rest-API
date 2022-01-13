
import 'package:instagram_clone/models/User.dart';
import 'package:instagram_clone/models/UserPost.dart';
import 'package:instagram_clone/services/post_services.dart';
import 'package:instagram_clone/services/user_services.dart';

class SearchViewModel {

  Future<List<MyUserData>> getUserByUsername(String username) {
    return UserService().getUserByUsername(username);
  }

  Future<List<PostData>> get fetchListPost async {
    return PostService().getListPosts();
  }

}