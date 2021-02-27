import 'package:carbon_emission/screens/chooseNewActivity.dart';
import 'package:carbon_emission/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'MainScreen.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LogIn extends StatefulWidget {
  static const routeName = '/logIn';
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // final databaseReference = Firestore.instance;
  GoogleSignInAccount _currentUser;
  //String _contactText;
  bool _newUser = true;
  Auth auth = new Auth();

  @override
  Future<void> initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
        auth.createUser(_currentUser);
        if (_currentUser != null)
          Navigator.of(context).pushNamed(MainScreen.routeName);
      });
    });
    _googleSignIn.signInSilently();
  }

  Widget _buildBody(double height, double width) {
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
          ),
          Text(_newUser ? "NEW USER REGISTERED" : "WELCOME BACK"),
          ElevatedButton(
            child: const Text('SIGN OUT'),
            onPressed: () {
              auth.handleSignOut(_googleSignIn);
            },
          ),
        ],
      );
    } else {
      return Container(
        color: Color(0xff281627),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              height: height * 0.35,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/login_screen.png'),
                      fit: BoxFit.contain)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Welcome",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text("""Sign In to continue""",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white38,
                      fontSize: 20)),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Padding(
              padding: EdgeInsets.only(left: 90, right: 90),
              child: RaisedButton(
                elevation: 0.0,
                color: Color(0xff281627),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                    side: BorderSide(color: Colors.white)),
                child: Row(
                  children: [
                    Icon(
                      Icons.login,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 1,
                      height: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      """Sign In with Google""",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  auth.handleSignIn(_googleSignIn);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 90, right: 90, top: 10),
              child: RaisedButton(
                elevation: 0.0,
                color: Color(0xff281627),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                    side: BorderSide(color: Colors.white)),
                child: Row(
                  children: [
                    Icon(
                      Icons.login,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 1,
                      height: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      """Sign In with Facebook""",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  print("Not Functional");
                },
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: _buildBody(height, width)));
  }
}
