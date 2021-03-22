import 'package:carbon_emission/models/user.dart';
import 'package:carbon_emission/widget/leaderBoardCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carbon_emission/models/leaderboardDetails.dart';
import 'package:provider/provider.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {

  var user;
  final databaseReference = Firestore.instance;
  List<LeaderBoardDetails> friendsRanking = [];

  Future<void> getRanks() async {
    var doc = await databaseReference.collection('LeaderBoard').getDocuments();
    setState(() async {
      for(var i=0;i<doc.documents.length;i++) {
        LeaderBoardDetails leaderBoardDetails = new LeaderBoardDetails(
          username: doc.documents[i].data['username'],
          userPoints: doc.documents[i].data['userPoints'],
          imgUrl: doc.documents[i].data['imgUrl'],
          leaderBoardRank: doc.documents[i].data['leaderBoardRank'],
          email: doc.documents[i].data['email'],
        );
        friendsRanking.add(leaderBoardDetails);
      }
      friendsRanking.sort((a, b) => b.userPoints.compareTo(a.userPoints));
      for(var i=0;i<friendsRanking.length;i++) {
        print(friendsRanking[i].email);
        if(friendsRanking[i].email == user.email_id) {
          print(i);
          await databaseReference.collection("LeaderBoard").document(user.email_id).updateData({
            'leaderBoardRank': i+1,
          });
          break;
        }
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);
    getRanks();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 25,
                right: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  Text(
                    "Leaderboard",
                    style: TextStyle(
                      fontSize: width * 0.06,
                      color: const Color(0xffFEBB46),
                    ),
                  ),
                  Icon(
                    Icons.account_circle_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.275,
            ),
            Expanded(
              child: Container(
                width: width,
                padding: EdgeInsets.only(left :25,right: 25,top:25),
                //   height: _height*0.53,
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    color: Colors.white),
                margin: EdgeInsets.fromLTRB(0, height * 0.04, 0, 0),

                child: Column(
                  children: [
                    Text(
                      "Global Friends",
                      style: TextStyle(
                        fontSize: width * 0.048,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffFEBB46),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.009,
                    ),
                    Container(
                      width: width * 0.45,
                      height: height * 0.001,
                      color: const Color(0xffFEBB46),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: friendsRanking.length-3,
                          itemBuilder: (BuildContext ctx, int index) {
                            return     LeaderBoardCard(friendsRanking[index+2].imgUrl, friendsRanking[index].username, 19.12, index+4, true);
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // RANKED - 1
        Positioned(
          bottom: height * 0.65,
          left: width * 0.35,
          child: CircleAvatar(
            radius: width * 0.14,
            backgroundColor: const Color(0xff95E27B),
            child: CircleAvatar(
              radius: width * 0.1325,
              backgroundImage: NetworkImage(friendsRanking[0].imgUrl),
            ),
          ),
        ),
        Positioned(
          bottom: height * 0.75,
          left: width * 0.55,
          child: CircleAvatar(
              radius: width * 0.03,
              backgroundColor: const Color(0xff95E27B),
              child: Text(
                "1",
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
        ),

        Positioned(
          bottom: height * 0.61,
          left: width * 0.35,
          child: Text(
            friendsRanking[0].username,
            style: TextStyle(color: Colors.white, fontSize: width * 0.04),
          ),
        ),

        // Ranked - 2

        Positioned(
          bottom: height * 0.6,
          left: width * 0.08,
          child: CircleAvatar(
            radius: width * 0.10,
            backgroundColor: const Color(0xffFEBB46),
            child: CircleAvatar(
              radius: width * 0.092,
              backgroundImage: NetworkImage(friendsRanking[1].imgUrl),
            ),
          ),
        ),
        Positioned(
          bottom: height * 0.66,
          left: width * 0.24,
          child: CircleAvatar(
              radius: width * 0.025,
              backgroundColor: const Color(0xffFEBB46),
              child: Text(
                "2",
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
        ),

        Positioned(
          bottom: height * 0.57,
          left: width * 0.08,
          child: Text(
            friendsRanking[1].username,
            style: TextStyle(color: Colors.white, fontSize: width * 0.03),
          ),
        ),

        //Ranked - 3

        Positioned(
          bottom: height * 0.6,
          right: width * 0.08,
          child: CircleAvatar(
            radius: width * 0.10,
            backgroundColor: const Color(0xffA48FD1),
            child: CircleAvatar(
              radius: width * 0.092,
              backgroundImage: NetworkImage(friendsRanking[2].imgUrl),
            ),
          ),
        ),
        Positioned(
          bottom: height * 0.66,
          right: width * 0.084,
          child: CircleAvatar(
              radius: width * 0.025,
              backgroundColor: const Color(0xffA48FD1),
              child: Text(
                "3",
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
        ),

        Positioned(
          bottom: height * 0.57,
          right: width * 0.08,
          child: Text(
            friendsRanking[2].username,
            style: TextStyle(color: Colors.white, fontSize: width * 0.03),
          ),
        ),
      ],
    );
  }
}
