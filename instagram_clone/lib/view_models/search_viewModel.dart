import 'package:instagram_clone/models/MyUserData.dart';
import 'package:instagram_clone/models/PostData.dart';
import 'package:instagram_clone/services/post_services.dart';
import 'package:instagram_clone/services/user_services.dart';

class SearchViewModel {

  Future<MyUserData> getUserByUsername(String username) {
    return UserService().getUserByUsername(username);
  }

  Future<List<PostData>> get fetchListPost async {
    return PostService().getListPosts();
  }

}