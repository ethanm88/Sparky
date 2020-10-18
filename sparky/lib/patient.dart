import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// import 'clickable.dart';
/// Flutter code sample for AppBar

// This sample shows TabBar with two tabs.
// The first tab is for short term memories
// The second tab is for long term memories
import 'package:flutter/material.dart';

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
                        child: Center(
                          child: Hero(
                            tag: 'imageHero',
                            child: Image.network(images[index]),
                          ),
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

// class DetailScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context, ) {
//     return Scaffold(
//       body: GestureDetector(
//         child: Center(
//           child: Hero(
//             tag: 'imageHero',
//             child: Image.network(
//               'https://images.pexels.com/photos/1804035/pexels-photo-1804035.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
//             ),
//           ),
//         ),
//         onTap: () {
//           Navigator.pop(context);
//         },
//       ),
//     );
//   }
}