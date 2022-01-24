import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/helper/image_processing.dart';
import 'package:instagram_clone/screens/upload_post_screen.dart';

class UploadImageScreen extends StatefulWidget {
  final String username, password;
  const UploadImageScreen({Key? key, required this.username, required this.password}) : super(key: key);

  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {

  ImageProcessing imageProcessing = ImageProcessing();
  // XFile? pickedFile;
  File? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('New post',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    // pickedFile: File(pickedFile!.path), username: widget.username, password: widget.password,

                  builder: (context) => UploadScreen(
                        pickedFile: pickedFile, username: widget.username, password: widget.password,

                      )));
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () async {
                    pickedFile = await imageProcessing.pickPhoto('Gallery');
                  },
                  child: const Text(
                    'Gallery',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    pickedFile = await imageProcessing.pickPhoto('Camera');
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/icons/instagram_camera_icon.svg',
                        width: 20,
                      ),
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
