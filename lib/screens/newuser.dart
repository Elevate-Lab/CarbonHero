import 'package:carbon_emission/widget/activity_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewUser extends StatefulWidget {
  static const routeName = '/newUser';
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final databaseReference = Firestore.instance;
  List<dynamic> listOfActivitiesToTrack;
  bool noActivtyOptions = true;

  void getActivityOptions() async {
    var doc = await databaseReference
        .collection("activities")
        .document("categories")
        .get();

    listOfActivitiesToTrack = doc['activitylist'];

    if (listOfActivitiesToTrack.isNotEmpty) {
      setState(() {
        noActivtyOptions = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getActivityOptions();
  }

  Widget _buildBody(double height, double width, BuildContext context) {
    if (noActivtyOptions) {
      return Padding(
        padding: EdgeInsets.only(left: 35, right: 35, top: 40, bottom: 40),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Hello Rayn!",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Add Activities That You Are Intrested To Track \nFor Carbon Emission",
                  style: TextStyle(fontSize: 20, color: Color(0xffFEBB46)),
                )
              ],
            ),
            SizedBox(
              height: height * 0.3,
            ),
            Text(
              "No Activites To Add",
              style: TextStyle(color: Colors.white, fontSize: 40),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(left: 35, right: 35, top: 40, bottom: 40),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Hello Rayn!",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Add Activities That You Are Intrested To Track",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffFEBB46),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Select only those activities that you are sure to track\nand maintain for better results",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Expanded(
              child: SizedBox.expand(
                child: GridView(
                  children: listOfActivitiesToTrack
                      .map((e) => ActivityCard(
                            nameOfActivity: e,
                          ))
                      .toList(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff281627),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: _buildBody(height, width, context),
      ),
    );
  }
}
