// import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

class Photoview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Photo View"),
      ),
      body: Photoview(
        // imageProvider: NetworkImage(
        //     'https://bezkoder.com/wp-content/uploads/2019/07/dart-list-complete-reference-feature-image.png',
        // ),
      ),
    );
  }
}