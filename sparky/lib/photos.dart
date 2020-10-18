import 'package:flutter/material.dart';
import 'package:sparky/example.dart';
// import 'package:photo_view/photo_view.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Spark your day!';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyPhotosPage(),
    );
  }
}

class MyPhotosPage extends StatefulWidget {
  const MyPhotosPage({Key, key}) : super(key: key);
  @override
  _AddedPhotosState createState() => _AddedPhotosState(); 
}

class _AddedPhotosState extends State<MyPhotosPage> {
  final title = 'Short term photos';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 4,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(16, (index) {
          return Center(
            child: (
              Image.network("https://bezkoder.com/wp-content/uploads/2019/07/dart-list-complete-reference-feature-image.png")
            ),
          );
        }),
      ),

    );
  }

}


