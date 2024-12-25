import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScrean extends StatefulWidget {
  const ImagePickerScrean({Key? key}) : super(key: key);

  @override
  _ImagePickerScreanState createState() => _ImagePickerScreanState();
}

class _ImagePickerScreanState extends State<ImagePickerScrean> {
  var imagePicker = ImagePicker();
  File? image;
  uploadImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("image picker"),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: uploadImage,
              child: Text("upload image"),
            ),
            Container(
                width: double.infinity,
                height: 400,
                child: image != null
                    ? Image.file(image!)
                    : Text("not choosen image"))
          ],
        ),
      ),
    );
  }
}
