import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login Screen',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Login',
            ),
          ),
          body: new Center(
            child: new Column(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text('Welcome to Sparky! Please enter your email and password.',
                    textAlign: TextAlign.center,
                  ),
                  new LoginFields()
                ],
            ),
          ),
          backgroundColor: Colors.white,
        ),
    );
  }
}

class LoginFields extends StatefulWidget {
  @override
  _LoginFieldsState createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
    final emailField = TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );

    final passwordField = TextField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );


  @override
  Widget build(BuildContext context) {
      return Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(height: 35.0),
                Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                    onPressed: () {login(context);},
                    child: Text("Login",
                    textAlign: TextAlign.center,
                    ),
                    ),
                ),
                SizedBox(
                  height: 15.0
                ),
              ],
            ),
          ),
        ),
      );
  }

  login(BuildContext Context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
