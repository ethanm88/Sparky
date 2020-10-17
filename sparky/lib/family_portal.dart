import 'package:flutter/material.dart';

void main() => runApp(FamilyPage());

class FamilyPage extends StatelessWidget {
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


class FamilyButton1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null, // will move to add photo page later
      child: new Text('Add a new photo'),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
      ),
    );
  }
}

class FamilyButton2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null, // will move to add photo page later
      child: new Text('Browse existing photos'),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
      ),
    );
  }
}