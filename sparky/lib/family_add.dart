import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
class FamilyAddPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Add Photo',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Add Photo'),
          ),
          body: new Center(
            child: new ImageHandler(),
          ),
        ),
    );
  }
}

class ImageHandler extends StatefulWidget {
  @override
  _ImageHandlerState createState() => _ImageHandlerState();
}

class _ImageHandlerState extends State<ImageHandler> {
  @override
  File _image;
  String _imagePath;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _imagePath = _image.path;
      } else {
        print('No Image selected.');
      }
      });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: new Column(
          children: <Widget>[
              CircleAvatar(
                radius: 150,
                child: _image == null
              ? Text('Press the camera button to choose a photo.')
              : Image.file(_image, width: 250, height: 250),
              ),
              new TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Caption',
                ),
                ),
                new ElevatedButton(
        //          onPressed: submitPhoto();
                  child: new Text('Add Photo'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                  ),
                ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo),
        ),
      );
    }
  }

