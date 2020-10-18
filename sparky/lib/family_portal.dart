import 'package:flutter/material.dart';
import 'family_add.dart';
import 'patient.dart';
// This file handles the "family portal" page; the page that family members go to
// to add photos or browse existing photos.
void main() => runApp(FamilyHomePage());
// Main class for the page
class FamilyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Family Members',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Family Members'),
        ),
        body: new Center(
          child: new Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FamilyButton1(),
            new FamilyButton2(),
          ]
          ),
        ),
    )
      );
  }
}

// Button to go to add photo page
class FamilyButton1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FamilyAddPage()),
        );
      },
        child: new Text('Add a new photo'),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
      ),
    );
  }
}
// Button to browse existing photos
class FamilyButton2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp())
        );
    },
      child: new Text('Browse existing photos'),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
        //onPressed: () {},
      ),
    );
  }
}

