import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

void setState() {
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
        home: Scaffold(
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
                          'https://bezkoder.com/wp-content/uploads/2019/07/dart-list-complete-reference-feature-image.png',
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      InkWell(
                        onTap: setState,
                        child: Image.network(
                          'https://bezkoder.com/wp-content/uploads/2019/07/dart-list-complete-reference-feature-image.png',
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      )],
                    ),
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
              'https://raw.githubusercontent.com/flutter/website/master/src/_includes/code/layout/lakes/images/lake.jpg',
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
