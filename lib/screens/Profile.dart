import 'package:carbon_emission/models/leaderboardDetails.dart';
import 'package:carbon_emission/models/user.dart';
// import 'package:carbon_emission/screens/splashScreen1.dart';
import 'package:carbon_emission/services/auth.dart';
import 'package:carbon_emission/widget/cirdular_progress_indicator.dart';
import 'package:carbon_emission/widget/leaderBoardCard.dart';
// import 'package:carbon_emission/widget/restart_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
    'https://www.googleapis.com/auth/contacts.other.readonly',
  ],
);

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
  static const routeName = '/ProfileScreen';
}

class _ProfileState extends State<Profile> {
  var user;
  var auth;
  var doc1, doc2;
  int friendsCount = 0;
  var database = Firestore.instance;
  List<dynamic> friends = [];
  List<LeaderBoardDetails> friendsRanking = [];
  int rank = 0;

  Future<void> getRank() async {
    var doc =
        await database.collection("LeaderBoard").document(user.email_id).get();
    if (this.mounted) {
      setState(() {
        rank = doc["leaderBoardRank"];
      });
    }
  }

removeUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Remove String
  prefs.setString("logInName", "logOut");
 
}
  Future<void> _getFriendsList() async {
    doc2 = await database.collection('users').document(user.email_id).get();

    for (int i = 0; i < doc2['userFriends'].length; i++) {
      friends.add(doc2['userFriends'][i]);
    }
    await _getFriendsDetails();
    return;
  }

  Future<void> _getFriendsDetails() async {
    friendsRanking.clear();
    for (int i = 0; i < friends.length; i++) {
      doc1 =
          await database.collection('LeaderBoard').document(friends[i]).get();
      if (doc1.exists) {
        LeaderBoardDetails leaderBoardDetails = new LeaderBoardDetails(
            username: doc1['username'],
            userPoints: doc1['userPoints'],
            imgUrl: doc1['imgUrl'],
            leaderBoardRank: doc1['leaderBoardRank'],
            email: doc1['email']);
        if (!friendsRanking.contains(leaderBoardDetails))
          friendsRanking.add(leaderBoardDetails);
      }
    }
    friendsRanking.sort((a, b) => b.userPoints.compareTo(a.userPoints));

    if (friendsRanking.length > friendsCount && this.mounted) {
      setState(() {
        friendsCount = friendsRanking.length;
      });
    }
    return;
  }

  @override
  void initState() {
    super.initState();
    user = Provider.of<User>(context, listen: false);
    _getFriendsList();
  }

  @override
  Widget build(BuildContext context) {
    getRank();
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    auth = new Auth();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: _height * 0.45,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage('assets/Cover.png'),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: _height * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                    //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                         
                          SizedBox(width: _width*0.275,),
                          Text(
                            "My Profile",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        
                        ],
                      ),
                    ),
                    Container(
                      width: _width * 0.3,
                      height: _height * 0.19,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          image: new DecorationImage(
                              image: new NetworkImage(user.img_url),
                              fit: BoxFit.fill),
                          shape: BoxShape.circle),
                    ),
                    Text(
                      user.userName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: _width,
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: _height * 0.06),
                  margin: EdgeInsets.only(top: _height * 0.018),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "My Friends",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      (friendsCount >= 1
                          ? Expanded(
                              child: ListView.builder(
                                  itemCount: friendsCount,
                                  itemBuilder: (BuildContext ctx, int index) {
                                    return LeaderBoardCard(
                                        friendsRanking[index].imgUrl,
                                        friendsRanking[index].username,
                                        friendsRanking[index].userPoints,
                                        index + 1,
                                        true);
                                  }),
                            )
                          : Column(
                              children: [
                                SizedBox(
                                  height: _height * 0.04,
                                ),
                                CircularProgressIndicatorApp(),
                                SizedBox(
                                  height: _height * 0.01,
                                ),
                                Text('Searching Your Friends'),
                              ],
                            ))
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: _height * 0.345,
            child: Container(
              height: _height * 0.1,
              width: _width * 0.8,
              margin: EdgeInsets.fromLTRB(
                  _width * 0.1, _height * 0.05, _width * 0.1, 0),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xff281627),
                borderRadius: new BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        rank.toString(),
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Global Rank",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 35,
                    width: 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        user.points_earned.toString(),
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Points Earned",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Are You Sure You Want To Log Out?'),
                  content: Text('Restart Application After Logging Out'),
                  actions: [
                    FlatButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text("No"),
                    ),
                    FlatButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text("Yes"),
                    )
                  ],
                );
              }).then((value) {
            if (value == null) return;
            if (value) {

              removeUser();
              auth.handleSignOut(_googleSignIn);
              SystemNavigator.pop();
            } else
              return;
          });
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
