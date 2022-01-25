import 'package:instagram_clone/models/PostData.dart';
import 'package:instagram_clone/services/post_services.dart';

class FeedViewModel {

  Future<List<PostData>> fetchListFeedPosts(String username, String password) async{
    return await PostService().getListFeedPosts(username, password);
  }
}