import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// This page is a list view of all the family members, to be integrated with the firebase database
void main() => runApp(FamilyPage());

final FamilyMembers = [
  {"name": "Filip", "photos": 15},
  {"name": "Abraham", "photos": 14},
  {"name": "Richard", "photos": 11},
  {"name": "Ike", "photos": 10},
  {"name": "Justin", "photos": 1},
  {"name": "Bill", "photos": 6},
  {"name": "John", "photos": 5},
  {"name": "Ted", "photos": 7},
  {"name": "Rob", "photos" : 25},
  {"name": "Will", "photos": 0},
  {"name": "Will", "photos": 0},
];

class FamilyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Family Members',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Family Members')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    // TODO: get actual snapshot from Cloud Firestore
    return _buildList(context, FamilyMembers);
  }

  Widget _buildList(BuildContext context, List<Map> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Map data) {
    final record = Record.fromMap(data);
    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.photos.toString()),
          onTap: () => print(record),
        ),
      ),
    );
  }
}

class Record {
  final String name;
  final int photos;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['photos'] != null),
        name = map['name'],
        photos = map['photos'];
  @override
  String toString() => "Record<$name:$photos>";
}