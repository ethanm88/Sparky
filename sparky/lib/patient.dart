/// Flutter code sample for AppBar

// This sample shows TabBar with two tabs.
// The first tab is for short term memories
// The second tab is for long term memories
import 'photos.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

String category1 = 'Short Term';
String category2 = 'Long Term';
/// This is the main application widget.
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

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

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
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Text('$label memories'),
              // Text('$label memories'),
              // Text('$label memories'),
              GridView.count(
                crossAxisCount: 4,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(100, (index) {
                  return Center(
                    child: Image(),
                  );
                }),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}


