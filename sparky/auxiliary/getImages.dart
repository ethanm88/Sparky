// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
//
//
// class ImagePage extends StatefulWidget {
//   ImagePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _ImagePageState createState() => _ImagePageState();
// }
//
// class _ImagePageState extends State<ImagePage> {
//   var storage = FirebaseStorage.instance;
//   List<NetworkImage> listOfImage;
//   bool clicked = false;
//   List<String> listOfStr = List();
//   List<String> listOfUrl = List();
//   String images;
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     getImages();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             GridView.builder(
//               shrinkWrap: true,
//               padding: const EdgeInsets.all(0),
//               itemCount: listOfImage.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   mainAxisSpacing: 3.0,
//                   crossAxisSpacing: 3.0),
//               itemBuilder: (BuildContext context, int index) {
//                 return GridTile(
//                   child: Material(
//                     child: GestureDetector(
//                       child: Stack(children: <Widget>[
//                         this.images == listOfImage[index].assetName ||
//                             listOfStr.contains(listOfImage[index].assetName)
//                             ? Positioned.fill(
//                             child: Opacity(
//                               opacity: 0.7,
//                               child: Image.asset(
//                                 listOfImage[index].assetName,
//                                 fit: BoxFit.fill,
//                               ),
//                             ))
//                             : Positioned.fill(
//                             child: Opacity(
//                               opacity: 1.0,
//                               child: Image.asset(
//                                 listOfImage[index].assetName,
//                                 fit: BoxFit.fill,
//                               ),
//                             )),
//                         this.images == listOfImage[index].assetName ||
//                             listOfStr.contains(listOfImage[index].assetName)
//                             ? Positioned(
//                             left: 0,
//                             bottom: 0,
//                             child: Icon(
//                               Icons.check_circle,
//                               color: Colors.green,
//                             ))
//                             : Visibility(
//                           visible: false,
//                           child: Icon(
//                             Icons.check_circle_outline,
//                             color: Colors.black,
//                           ),
//                         )
//                       ]),
//                       onTap: () {
//                         setState(() {
//                           if (listOfStr
//                               .contains(listOfImage[index].assetName)) {
//                             this.clicked = false;
//                             listOfStr.remove(listOfImage[index].assetName);
//                             this.images = null;
//                           } else {
//                             this.images = listOfImage[index].assetName;
//                             listOfStr.add(this.images);
//                             this.clicked = true;
//                           }
//                         });
//                       },
//                     ),
//                   ),
//                 );
//               },
//             ),
//             Builder(builder: (context) {
//               return RaisedButton(
//                   child: Text("Save Images"),
//                   onPressed: () {
//                     setState(() {
//                       this.isLoading = true;
//                     });
//                     listOfStr.forEach((img) async {
//                       String imageName = img
//                           .substring(img.lastIndexOf("/"), img.lastIndexOf("."))
//                           .replaceAll("/", "");
//
//                       final Directory systemTempDir = Directory.systemTemp;
//                       final byteData = await rootBundle.load(img);
//
//                       final file =
//                       File('${systemTempDir.path}/$imageName.jpeg');
//                       await file.writeAsBytes(byteData.buffer.asUint8List(
//                           byteData.offsetInBytes, byteData.lengthInBytes));
//                       StorageTaskSnapshot snapshot = await storage
//                           .ref()
//                           .child("images/$imageName")
//                           .putFile(file)
//                           .onComplete;
//                       if (snapshot.error == null) {
//                         final String downloadUrl =
//                         await snapshot.ref.getDownloadURL();
//                         await FirebaseFirestore.instance
//                             .collection("images")
//                             .add({"url": downloadUrl, "name": imageName});
//                         setState(() {
//                           isLoading = false;
//                         });
//                         final snackBar =
//                         SnackBar(content: Text('Yay! Success'));
//                         Scaffold.of(context).showSnackBar(snackBar);
//                       } else {
//                         print(
//                             'Error from image repo ${snapshot.error.toString()}');
//                         throw ('This file is not an image');
//                       }
//                     });
//                   });
//             }),
//             isLoading
//                 ? CircularProgressIndicator()
//                 : Visibility(visible: false, child: Text("test")),
//           ],
//         ),
//       ),
//     );
//   }
//   void getImages() async {
//     final FirebaseStorage _storage =
//     FirebaseStorage(storageBucket: 'gs://sparky-b4bb8.appspot.com');
//     listOfImage = List();
//     final ref = FirebaseStorage.instance.ref().child('testimage');
//     // no need of the file extension, the name will do fine.
//     var url = await ref.getDownloadURL();
//     listOfImage.add(
//       NetworkImage(url)
//     );
//     /*
//     for (int i = 0; i < 6; i++) {
//       listOfImage.add(
//           AssetImage('assets/images/travelimage' + i.toString() + '.jpeg'));
//     }
//     */
//
//   }
// }
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class ImagePage extends StatefulWidget {
  ImagePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  var storage = FirebaseStorage.instance;
  List<NetworkImage> listOfImage;
  bool clicked = false;
  List<String> listOfStr = List();
  List<String> listOfUrl = List();
  String images;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getImages();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.title),
  //     ),
  //     body: Container(
  //       child: Column(
  //         children: <Widget>[
  //           GridView.builder(
  //             shrinkWrap: true,
  //             padding: const EdgeInsets.all(0),
  //             itemCount: listOfImage.length,
  //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                 crossAxisCount: 3,
  //                 mainAxisSpacing: 3.0,
  //                 crossAxisSpacing: 3.0),
  //             itemBuilder: (BuildContext context, int index) {
  //               var assetName;
  //               return GridTile(
  //                 child: Material(
  //                   child: GestureDetector(
  //                     child: Stack(children: <Widget>[
  //                       this.images == listOfImage[index].assetName ||
  //                           listOfStr.contains(listOfImage[index].assetName)
  //                           ? Positioned.fill(
  //                           child: Opacity(
  //                             opacity: 0.7,
  //                             child: Image.asset(
  //                               listOfImage[index].assetName,
  //                               fit: BoxFit.fill,
  //                             ),
  //                           ))
  //                           : Positioned.fill(
  //                           child: Opacity(
  //                             opacity: 1.0,
  //                             child: Image.asset(
  //                               listOfImage[index].assetName,
  //                               fit: BoxFit.fill,
  //                             ),
  //                           )),
  //                       this.images == listOfImage[index].assetName ||
  //                           listOfStr.contains(listOfImage[index].assetName)
  //                           ? Positioned(
  //                           left: 0,
  //                           bottom: 0,
  //                           child: Icon(
  //                             Icons.check_circle,
  //                             color: Colors.green,
  //                           ))
  //                           : Visibility(
  //                         visible: false,
  //                         child: Icon(
  //                           Icons.check_circle_outline,
  //                           color: Colors.black,
  //                         ),
  //                       )
  //                     ]),
  //                     onTap: () {
  //                       setState(() {
  //                         if (listOfStr
  //                             .contains(listOfImage[index].assetName)) {
  //                           this.clicked = false;
  //                           listOfStr.remove(listOfImage[index].assetName);
  //                           this.images = null;
  //                         } else {
  //                           this.images = listOfImage[index].assetName;
  //                           listOfStr.add(this.images);
  //                           this.clicked = true;
  //                         }
  //                       });
  //                     },
  //                   ),
  //                 ),
  //               );
  //             },
  //           ),
  //           Builder(builder: (context) {
  //             return RaisedButton(
  //                 child: Text("Save Images"),
  //                 onPressed: () {
  //                   setState(() {
  //                     this.isLoading = true;
  //                   });
  //                   listOfStr.forEach((img) async {
  //                     String imageName = img
  //                         .substring(img.lastIndexOf("/"), img.lastIndexOf("."))
  //                         .replaceAll("/", "");
  //
  //                     final Directory systemTempDir = Directory.systemTemp;
  //                     final byteData = await rootBundle.load(img);
  //
  //                     final file =
  //                     File('${systemTempDir.path}/$imageName.jpeg');
  //                     await file.writeAsBytes(byteData.buffer.asUint8List(
  //                         byteData.offsetInBytes, byteData.lengthInBytes));
  //                     StorageTaskSnapshot snapshot = await storage
  //                         .ref()
  //                         .child("images/$imageName")
  //                         .putFile(file)
  //                         .onComplete;
  //                     if (snapshot.error == null) {
  //                       final String downloadUrl =
  //                       await snapshot.ref.getDownloadURL();
  //                       await FirebaseFirestore.instance
  //                           .collection("images")
  //                           .add({"url": downloadUrl, "name": imageName});
  //                       setState(() {
  //                         isLoading = false;
  //                       });
  //                       final snackBar =
  //                       SnackBar(content: Text('Yay! Success'));
  //                       Scaffold.of(context).showSnackBar(snackBar);
  //                     } else {
  //                       print(
  //                           'Error from image repo ${snapshot.error.toString()}');
  //                       throw ('This file is not an image');
  //                     }
  //                   });
  //                 });
  //           }),
  //           isLoading
  //               ? CircularProgressIndicator()
  //               : Visibility(visible: false, child: Text("test")),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  // void getImages() async {
  //   final FirebaseStorage _storage =
  //   FirebaseStorage(storageBucket: 'gs://sparky-b4bb8.appspot.com');
  //   listOfImage = List();
  //   final ref = FirebaseStorage.instance.ref().child('testimage');
  //   // no need of the file extension, the name will do fine.
  //   var url = await ref.getDownloadURL();
  //   listOfImage.add(
  //     NetworkImage(url)
  //   );
  //   /*
  //   for (int i = 0; i < 6; i++) {
  //     listOfImage.add(
  //         AssetImage('assets/images/travelimage' + i.toString() + '.jpeg'));
  //   }
  //   */
  //
  // }
}
