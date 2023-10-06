import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccessCameraPage extends StatefulWidget {
  @override
  _AccessCameraPageState createState() => _AccessCameraPageState();
}

class _AccessCameraPageState extends State<AccessCameraPage> {
  File? _image;
//digunakan untuk menampung image
  Future<void> openCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    } else {
      // Handle the case where the user canceled the camera operation.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Access Camera"),
      ),
      body: Container(
        child: Center(
          child: _image == null ? Text("No Image") : Image.file(_image!),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add_a_photo,
            color: Colors.white,
          ),
          backgroundColor: Colors.green,
          onPressed: () {
            openCamera();
          }), // memulai floating button
    );
  }
}
