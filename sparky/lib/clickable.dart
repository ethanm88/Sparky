import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

void setState(Null Function() param0) {
  scaffoldKey.currentState.showSnackBar(snackBar);

}

class MyApp extends StatelessWidget {
  // FullScreenPage fullScreenPage = new FullScreenPage();

  // void makeFullScreen(BuildContext context) {
  //   fullScreenPage.build(context);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyClickable()
    );
  }
}

class MyClickable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Center(
          child: Column(children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return DetailScreen();
                }));
              },
              child: Image.network(
                'https://images.pexels.com/photos/1804035/pexels-photo-1804035.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                width: 200,
                fit: BoxFit.cover,
              ),
            )],
          ),
        ),
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
