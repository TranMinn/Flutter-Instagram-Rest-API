import 'package:instagram_clone/models/PostData.dart';
import 'package:instagram_clone/services/post_services.dart';

class FeedViewModel {

  Future<List<PostData>> get fetchListPost async{
    return await PostService().getListPosts();
  }
}