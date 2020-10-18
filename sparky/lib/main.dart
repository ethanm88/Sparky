import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //rest of the code
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upload Images',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    Future<List<String>> a = (User.getDocs());
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  Widget build(BuildContext context) {
    /**
    User _userObj = new User(
      name: "Ethan",
      id: 1,
      isParent: false,
      parentId: 0
    );
    CollectionReference dbReplies = FirebaseFirestore.instance.collection('users');
    FirebaseFirestore.instance.runTransaction((Transaction tx) async {
      var _result = await dbReplies.add(_userObj.toJson());
    });
        */



    return Scaffold(
      appBar: AppBar(title: Text('Baby Name Votes')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = User.fromSnapshot(data);
    return Padding(
      key: ValueKey(record.parentId),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.id.toString()),
          onTap: () => print(record),
        ),
      ),
    );
  }
}

class User {
  String name;
  int id;
  bool isParent;
  int parentId;
  List<dynamic> connections;
  DocumentReference reference = null; //check

  User({
    @required this.name,
    @required this.id,
    @required this.isParent,
    @required this.parentId,
    @required this.connections
  });

  Map<String, dynamic> toJson() =>
      {
        'name': this.name,
        'id': this.id,
        'isParent': this.isParent,
        'parentId': this.parentId,
        //'connections': this.connections
      };
  void addData(firestoreInstance) {
    firestoreInstance.collection("users").add(
        {
          'name': this.name,
          'id': this.id,
          'isParent': this.isParent,
          'parentId': this.parentId,
          //'connections': this.connections

        }).then((value){
      print(value.id);
    });
  }


  User.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['id'] != null),
        assert(map['isParent'] != null),
        assert(map['parentId'] != null),
        name = map['name'],
        id = map['id'],
        isParent = map['isParent'],
        parentId = map['parentId'];
        //connections = map['connections'];
  Future updateData(String name, int id, bool isParent, int parentId, List connections) async{
    Firestore.instance
        .collection('Users')
        .document(reference.id)
        .updateData({
        'name': name,
        'id': id,
        'isParent': isParent,
        'parentId': parentId,
        //'connections': connections
    });

  }

  static Future<List<String>> getDocs()  async {
    List<String> allId = new List<String>();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("users").getDocuments();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      allId.add(a.id);
    }
  }


  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "User<$name:$id>";
}