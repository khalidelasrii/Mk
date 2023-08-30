import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class TestImages extends StatefulWidget {
  const TestImages({super.key});

  @override
  State<TestImages> createState() => _TestImagesState();
}

class _TestImagesState extends State<TestImages> {
  @override
  Widget build(BuildContext context) {
    File file;

    ImagePicker imagepicker = ImagePicker();
    uplodingImages() async {
      var imagepicked =
          await imagepicker.pickImage(source: ImageSource.gallery);

      if (imagepicked != null) {
        file = File(imagepicked.path); // start Uploded;
        var refStorage =
            FirebaseStorage.instance.ref("images/${imagepicked.name}");
        await refStorage.putFile(file);
        var imageUrl = await refStorage.getDownloadURL();

        print('URL : $imageUrl');
      } else {
        print('Plaise chose image');
      }
    }

    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              uplodingImages();
            },
            child: const Icon(Icons.add)),
      ),
    );
  }
}
