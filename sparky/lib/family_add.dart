import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'ImagePicker.dart';

class FamilyAddPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Add Photo',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Add Photo'),
          ),
          body: new Center(
            child: new ImageCapture(),
          ),
        ),
    );
  }
}
