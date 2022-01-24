import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_clone/models/MyUserData.dart';
import 'package:instagram_clone/screens/root_screen.dart';
import 'package:instagram_clone/view_models/account_viewModel.dart';
import 'package:instagram_clone/view_models/upload_post_viewModel.dart';
import 'package:instagram_clone/widgets/loading_widget.dart';

class UploadScreen extends StatefulWidget {
  final File? pickedFile;
  final String username, password;

  const UploadScreen({Key? key, required this.pickedFile, required this.username, required this.password}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  UploadPostViewModel uploadPostViewModel = UploadPostViewModel();

  final captionController = TextEditingController();
  final locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MyUserData?>(
        future: AccountViewModel().fetchCurrentUserData(widget.username, widget.password),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingWidget();
          } else {
            MyUserData? myUserData = snapshot.data;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: const Text('New post',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
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
                      // final String? fileName = widget.pickedFile?.name;
                      // final String? filePath = widget.pickedFile?.path;

                      await uploadPostViewModel
                          .uploadPost(widget.pickedFile!,
                              captionController.text, widget.username, widget.password)
                          .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RootScreen(username: widget.username, password: widget.password))));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.blue,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
              body: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                      File(widget.pickedFile!.path)))),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 8.0),
                          child: TextField(
                            controller: captionController,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: 'Write a caption...',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Location'),
                  )
                ],
              ),
            );
          }
        });
  }
}
