import 'package:carbon_emission/screens/newuser.dart';
import 'package:carbon_emission/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
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

  Widget _buildBody() {
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
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("You are not currently signed in."),
          ElevatedButton(
            child: const Text('SIGN IN'),
            onPressed: () {
              auth.handleSignIn(_googleSignIn);
            },
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }
}
