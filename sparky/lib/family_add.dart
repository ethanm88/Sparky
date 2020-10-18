import 'package:flutter/material.dart';
import 'ImagePicker.dart';
// This file handles the basic structure of the family add photo page.
// Details of the photo adding interface are in ImagePicker.dart
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
