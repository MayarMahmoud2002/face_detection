import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';

class FaceDetectionScreen extends StatefulWidget {
  @override
  State<FaceDetectionScreen> createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  File? _image;
  List<Face> faces = [];

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      setState(() {
        _image = File(image.path);
      });
    } catch (e) {
      print(e);
    }
  }

  Future _detectFace(File img) async {
    final options = FaceDetectorOptions();
    final faceDetector = FaceDetector(options: options);
    final inputImage = InputImage.fromFilePath(img.path);
     faces = await faceDetector.processImage(inputImage);
    setState(() {});
    print(faces.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Face Detection',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Container(
              color: Colors.grey,
              width: double.infinity,
              height: 250.0,
              child: _image == null
                  ? Icon(
                      Icons.add_a_photo_outlined,
                      size: 60.0,
                      color: Colors.white,
                    )
                  : Image.file(_image!),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          MaterialButton(
            onPressed: () {
              _pickImage(ImageSource.gallery).then((value) {
                if (_image != null) {
                  _detectFace(_image!);
                }
              });
            },
            child: Container(
              color: Colors.pinkAccent,
              width: 250,
              height: 60.0,
              child: Center(
                  child: Text(
                'Take Photo from Gallary',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          MaterialButton(
            onPressed: () {
              _pickImage(ImageSource.camera).then((value) {
                if (_image != null) {
                  _detectFace(_image!);
                }
              });
            },
            child: Container(
              color: Colors.pinkAccent,
              width: 250,
              height: 60.0,
              child: Center(
                  child: Text(
                'Take Photo from Camera',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'The number of Faces in Photo : ${faces.length}',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          )
        ]),
      ),
    );
  }
}
