import 'package:carbon_emission/screens/newuser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  final databaseReference = Firestore.instance;
  GoogleSignInAccount _currentUser;
  //String _contactText;
  bool _newUser = true;

  void createUser() async {
    var doc = await databaseReference.collection('users').document(_currentUser.email).get();
    print(_newUser);
    if(doc.exists) {
      setState(() {
        _newUser = false;
      });
      print(_newUser);
      return;
    }
    if(_newUser) {
      Navigator.of(context).pushNamed(NewUser.routeName);
    }
    await databaseReference.collection("users").document(_currentUser.email)
        .setData({
            'email': _currentUser.email,
            'name': _currentUser.displayName
        });
  }

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
        createUser();
      });
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

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
            onPressed: _handleSignOut,
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
            onPressed: _handleSignIn,
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

// ------------------------------------------------------------------
// facebook login code(don't touch)
// bool _isloggedIn = false;
// Map user;
// final facebooklogin = FacebookLogin();
//
// _logonwithfb() async {
//   final result = await facebooklogin.logInWithReadPermissions(['email']);
//   switch (result.status) {
//     case FacebookLoginStatus.loggedIn:
//       final token = result.accessToken.token;
//       final graphResponse = await http.get(
//           'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
//       print("555555");
//       final profile = JSON.jsonDecode(graphResponse.body);
//       print(profile);
//       setState(() {
//         user = profile;
//         _isloggedIn = true;
//       });
//       break;
//
//     case FacebookLoginStatus.cancelledByUser:
//       setState(() {
//         _isloggedIn = false;
//       });
//       break;
//     case FacebookLoginStatus.error:
//       setState(() {
//         _isloggedIn = false;
//       });
//   }
// }
//
// _logout() {
//   facebooklogin.logOut();
//   setState(() {
//     _isloggedIn = false;
//   });
// }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Center(
//         child: _isloggedIn
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.network(user["picture"]["data"]["url"],
//                       height: 50.0, width: 50.0),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Text(
//                     'Name:${user['name']}\nEmail:${user['email']}',
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   RaisedButton(
//                     child: Text("Logout"),
//                     onPressed: () {
//                       _logout();
//                     },
//                   ),
//                 ],
//               )
//             : Center(
//                 child: RaisedButton(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   child: Text("Login with Facebook"),
//                   onPressed: () {
//                     _logonwithfb();
//                   },
//                 ),
//               )),
//   );
// }