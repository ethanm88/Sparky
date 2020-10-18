import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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


class Image {
  String caption;
  String imageId;
  DocumentReference reference = null; //check

  Image({
    @required this.caption,
    @required this.imageId
  });

  Map<String, dynamic> toJson() =>
      {
        'caption': this.caption,
        'imageId': this.imageId,
        //'connections': this.connections
      };
  void addData(firestoreInstance) {
    firestoreInstance.collection("users").add(
        {
          'caption': this.caption,
          'imageId': this.imageId,
          //'connections': this.connections

        }).then((value){
      print(value.id);
    });
  }


  User.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['caption'] != null),
        assert(map['imageId'] != null),
        caption = map['caption'],
        imageId = map['imageId'];
  //connections = map['connections'];
  Future updateData(String caption, String imageId) async{
    Firestore.instance
        .collection('Users')
        .document(reference.id)
        .updateData({
      'caption': caption,
      'imageId': imageId,
      //'connections': connections
    });

  }

  static Future<List<String>> getDocs()  async {
    List<String> allId = new List<String>();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("images").getDocuments();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      allId.add(a.id);
    }
  }


  Image.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Image<$caption:$imageId>";
}