import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dbClasses.dart';


void main() => runApp(MyApp());

String category1 = 'Short Term';
String category2 = 'Long Term';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

List<String> images = new List<String>();
//
// void addImage(String image) {
//   setState(() {
//     images.add(image);
//   });
// }

class MyApp extends StatelessWidget {
  static const String _title = 'Spark your day!';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyTabbedPage(),
    );
  }


}

class Url{

  static Future<int> getId(String docId, String element) async {
    int s = 0;
    await FirebaseFirestore.instance.collection('users').where(
        FieldPath.documentId,
        isEqualTo: docId
    ).get().then((event) {
      if (event.docs.isNotEmpty) {
        Map<String, dynamic> documentData = event.docs.single.data(); //if it is a single document

        s = documentData[element];
        print(s);
      }
    }).catchError((e) => print("error fetching data: $e"));
    return s;
  }

  static String getImage(String filename) async{
    var ref = FirebaseStorage.instance.ref().child(fileName)
    String location = await ref.getDownloadURL();
    return locati
  }

  static List<String> getUrls() {

    /// Unique file name for the file
    String documentId = '2LjCQBHAxrTD6tQ9F5eI';
    int id;
    int num_images;
    getId(documentId, 'id').then((value) {
      print('Value1');
      print(value);
      id = value;


      getId(documentId, 'numImages').then((value) {
        print('Value2');
        num_images = value;

        //print(num_images);
        //print((num_images+1).toString());
        //print(id);
        String identifier = id.toString() + '_' + (num_images+1).toString();
        String filePath = 'images/${identifier}.png';



        CollectionReference dbReplies = FirebaseFirestore.instance.collection('images');
        FirebaseFirestore.instance.runTransaction((Transaction tx) async {
          var _result = await dbReplies.add(_userObj.toJson());

        });
        FirebaseFirestore.instance
            .collection('users')
            .document(documentId)
            .updateData({
          'num_images': num_images+1
        });
        setState(() {
          _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
        });
      });

    });



  }


}

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({ Key key }) : super(key: key);
  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '$category1'),
    Tab(text: category2),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  // images.add(new Image());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(

        controller: _tabController,
        children: myTabs.map((Tab tab) {
          final String label = tab.text;
          return Scaffold (
            body: GridView.count(
              crossAxisCount: 3,
              children: List.generate(images.length, (index) {
                return Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return DetailScreen();
                          }));
                        },

                        child: Image.network(images[index],
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://images.pexels.com/photos/1804035/pexels-photo-1804035.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }




}