import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_clone/models/MyUserData.dart';
import 'package:instagram_clone/view_models/edit_profile_viewModel.dart';

class EditProfileScreen extends StatefulWidget {
  final MyUserData myUserData;
  final String password;
  const EditProfileScreen(
      {Key? key, required this.myUserData, required this.password})
      : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileViewModel editProfileViewModel = EditProfileViewModel();

  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final bioController = TextEditingController();

  File? newPhoto;
  String? newPhotoUrl;

  @override
  void initState() {
    super.initState();

    fullNameController.text = widget.myUserData.fullname ?? '';
    usernameController.text = widget.myUserData.username ?? '';
    bioController.text = widget.myUserData.bio ?? '';
    newPhotoUrl = widget.myUserData.profilePic ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:
            const Text('Edit Profile', style: TextStyle(color: Colors.black)),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.close,
            color: Colors.black,
            size: 40,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              await editProfileViewModel
                  .editUserProfile(
                      usernameController.text,
                      fullNameController.text,
                      bioController.text,
                      widget.password)
                  .then((value) {
                print('Updated');
                Navigator.pop(context);
              });

              // newPhotoUrl!,
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.done,
                color: Colors.blue,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _showImageDialog,
                child: Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        image: DecorationImage(
                          image: newPhotoUrl.toString().isNotEmpty
                              ? NetworkImage(newPhotoUrl.toString())
                              : const AssetImage(
                                      'assets/icons/default_profile_image.jpg')
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ),
              GestureDetector(
                onTap: _showImageDialog,
                child: const Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Text(
                    'Change profile photo',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    labelText: 'Name',
                  ),
                  controller: fullNameController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Username',
                    labelText: 'Username',
                  ),
                  controller: usernameController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Bio',
                    labelText: 'Bio',
                  ),
                  controller: bioController,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _showImageDialog() {
    return showDialog(
        context: context,
        builder: ((context) {
          return SimpleDialog(
            children: [
              SimpleDialogOption(
                child: const Text('New Profile Photo'),
                onPressed: () async {
                  await editProfileViewModel.getProfilePhoto().then((value) {
                    setState(() {
                      newPhoto = value;
                    });
                    Navigator.pop(context);
                  });
                  // Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                child: const Text('Import From Facebook'),
                onPressed: () {},
              ),
            ],
          );
        }));
  }
}
