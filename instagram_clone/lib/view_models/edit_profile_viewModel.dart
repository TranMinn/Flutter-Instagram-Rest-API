
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/helper/image_processing.dart';
import 'package:instagram_clone/services/user_services.dart';

class EditProfileViewModel {

  Future<File> getProfilePhoto() async {
    XFile? pickedFile = await ImageProcessing().pickPhoto('Gallery');
    final filePath = pickedFile?.path;
    // final fileName = pickedFile?.name;
    //
    // await ImageProcessing().uploadPhoto(filePath!, fileName!);
    //
    // String photoUrl = await ImageProcessing().downloadUrl(fileName);
    return File(filePath!);
  }

  // Update User Profile info
  Future editUserProfile(String username, String fullName, String bio, String password) async {

    await UserService().editUserProfile(username, fullName, bio, password);
  }

  // Update User profile picture
Future editUserProfilePicture(String apiUrl, File image, String username, String password) async {

}

}