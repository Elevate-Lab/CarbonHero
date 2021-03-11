import 'package:carbon_emission/models/user.dart';
import 'package:carbon_emission/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:provider/provider.dart';

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
  final databaseReference = Firestore.instance;
  GoogleSignInAccount _currentUser;
  //String _contactText;
  var data;
  bool _newUser = true;
  Auth auth = new Auth();
  var doc;
  Future<void> getDetails() async {
    doc = await databaseReference.collection("users").document(_currentUser.email).get();
    data.name = doc['userName'];
    data.total_carbon_emission_this_month = doc['totalCarbonEmissionThisMonth'];
    data.batches_earned = doc['batchesEarned'];
    data.total_carbon_emission_last_month = doc['totalCarbonEmissionLastMonth'];
    data.total_carbon_emission_today = doc['totalCarbonEmissionToday'];
    data.total_carbon_emission_yesterday = doc['totalCarbonEmissionYesterday'];
    Navigator.of(context).pushNamed(MainScreen.routeName);
  }
  
  @override
  Future<void> initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
        auth.createUser(_currentUser);
        if(_currentUser != null)
          print(55555);
         // getDetails();
          // User newUser = new User(userId: doc['userId'], userName: doc['userName'], emailId: doc['emailId'],
          //   imgUrl: doc['imgUrl'], savedCarbonEmission: doc['savedCarbonEmission'], totalCarbonEmissionThisMonth: doc['totalCarbonEmissionThisMonth'],
          //   totalCarbonEmissionLastMonth: doc['totalCarbonEmissionLastMonth'], totalCarbonEmissionYesterday: doc['totalCarbonEmissionYesterday'],
          //   totalCarbonEmissionToday: doc['totalCarbonEmissionToday'], batchesEarned: doc['batchesEarned'],
          //   pointsEarned: doc['pointsEarned'], userFriends: doc['userFriends']);
          //
          print(777);
      });
    });
    _googleSignIn.signInSilently();
  }

  Widget _buildBody(double height, double width) {
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
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
              height: height * 0.05,
            ),
            Material(
              color: Color(0xff281627),
              child: InkWell(
                splashColor: Colors.purple[100],
                onTap: () {
                  auth.handleSignIn(_googleSignIn);
                },
                child: Container(
                  padding: EdgeInsets.all(width*0.02),
                  width: width * 0.75,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  //color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          fontSize: width*0.05,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Material(
              color: Color(0xff281627),
              child: InkWell(
                splashColor: Colors.purple[100],
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(width*0.02),
                width: width * 0.75,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  //color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          fontSize: width*0.05,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    data = Provider.of<User>(context);
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
