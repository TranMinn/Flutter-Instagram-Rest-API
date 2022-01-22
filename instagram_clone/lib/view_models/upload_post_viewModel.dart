import 'dart:io';

import 'package:instagram_clone/services/post_services.dart';

class UploadPostViewModel {
  Future uploadPost(File pickedFile,
      String text, String username, String password) async {

    // take a file to upload via api link

    // await ImageProcessing().uploadPhoto(filePath, fileName);
    // print('Image uploaded');
    // dynamic postPhotoUrl = await ImageProcessing().downloadUrl(fileName);
    // print(postPhotoUrl);

    await PostService()
        .uploadPost(pickedFile, text, username, password);
  }
}
