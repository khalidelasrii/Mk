import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  final ImagePicker _picker = ImagePicker();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Uint8List? _imageBytes;

  Future<void> _pickImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        // Lisez le fichier image en tant que tableau d'octets (Uint8List)
        _imageBytes = File(image.path).readAsBytesSync();
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _uploadImage() async {
    if (_imageBytes != null) {
      try {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        firebase_storage.Reference ref =
            storage.ref().child('images/$fileName.jpg');

        // Utilisez la méthode putData pour télécharger des données (tableau d'octets)
        await ref.putData(_imageBytes!);

        String downloadURL = await ref.getDownloadURL();
        print('Image uploaded and URL: $downloadURL');
      } catch (e) {
        print('Error uploading image: $e');
      }
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Storage Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageBytes != null
                ? Image.memory(
                    _imageBytes!,
                    height: 200,
                  )
                : SizedBox(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
