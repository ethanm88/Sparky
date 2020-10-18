import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Widget to capture and crop the image

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageCapture(),
    );
  }
}

class ImageCapture extends StatefulWidget {
  _ImageCaptureState createState() {
    return _ImageCaptureState();
  }

}

class _ImageCaptureState extends State<ImageCapture> {
  /// Active image file, caption for file
  File _imageFile;
  String _caption;
  static final TextEditingController captionController = TextEditingController();

  /// Cropper plugin
  Future<void> _cropImage() async {
    print('here');
    File cropped = await ImageCropper.cropImage(
        sourcePath: _imageFile.path,
        // ratioX: 1.0,
        // ratioY: 1.0,
        // maxWidth: 512,
        // maxHeight: 512,
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white,
        toolbarTitle: 'Crop It'
    );

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  /// Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  /// Remove image
  void _clear() {
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    print("building");
    return Scaffold(

      // Select an image from the camera or gallery
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),

      // Preview the image and crop it
      body: ListView(
        children: <Widget>[
          if (_imageFile != null) ...[
            Image.file(_imageFile, width: 450, height:450),
            new TextField(
              controller: captionController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Caption',
              ),
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.crop),
                  onPressed: _cropImage,
                ),
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                ),
              ],
            ),

            Uploader(file: _imageFile)
          ]
        ],
      ),
    );
  }
}


class Uploader extends StatefulWidget {
  final File file;
  Uploader({Key key, this.file}): super(key: key);

  createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage =
  FirebaseStorage(storageBucket: 'gs://sparky-b4bb8.appspot.com');

  StorageUploadTask _uploadTask;

  /// Starts an upload task
  Future<void> _startUpload() async {
    /*
    /// Unique file name for the file
    String documentId = '2LjCQBHAxrTD6tQ9F5eI'; //change
    Widget build(BuildContext context) {
      return new StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').doc(documentId).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return new Text("Loading");
            }
            var userDocument = snapshot.data;
            print('HELLOOOOOO');
            print(userDocument["name"]);
            return new Text(userDocument["name"]);
          }
      );
    }

     */

    String filePath = 'images/${DateTime.now()}.png';
    String caption = _ImageCaptureState.captionController.text;
    print(caption);
    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {

      /// Manage the task state and event subscription with a StreamBuilder
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (_, snapshot) {
            var event = snapshot?.data?.snapshot;

            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;

            return Column(

              children: [
                if (_uploadTask.isComplete)
                  Text('Complete '),


                if (_uploadTask.isPaused)
                  FlatButton(
                    child: Icon(Icons.play_arrow),
                    onPressed: _uploadTask.resume,
                  ),

                if (_uploadTask.isInProgress)
                  FlatButton(
                    child: Icon(Icons.pause),
                    onPressed: _uploadTask.pause,
                  ),

                // Progress bar
                LinearProgressIndicator(value: progressPercent),
                Text(
                    '${(progressPercent * 100).toStringAsFixed(2)} % '
                ),
              ],
            );
          });


    } else {

      // Allows user to decide when to start the upload
      return FlatButton.icon(
        label: Text('Add Photo to Memories'),
        icon: Icon(Icons.cloud_upload),
        onPressed: _startUpload,
      );

    }
  }
}
