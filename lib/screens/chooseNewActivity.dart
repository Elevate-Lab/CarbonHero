import 'package:carbon_emission/models/activityDetails.dart';
import 'package:carbon_emission/models/user.dart';
import 'package:carbon_emission/widget/activity_card.dart';
import 'package:carbon_emission/widget/cirdular_progress_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class chooseNewActivity extends StatefulWidget {
  static const routeName = '/chooseNewActivity';
  @override
  _chooseNewActivityState createState() => _chooseNewActivityState();
}

class _chooseNewActivityState extends State<chooseNewActivity> {
  final databaseReference = Firestore.instance;
  List<dynamic> listOfActivitiesToTrack;
  List<dynamic> listOfRoutes;
  List<dynamic> listOfImgAssets;
  List<ActivityDetails> detailsOfActivity = [];
  bool noActivtyOptions = true;

  void getActivityOptions() async {
    var doc = await databaseReference
        .collection("activities")
        .document("categories")
        .get();

    listOfRoutes = doc['activityRoutes'];

    listOfActivitiesToTrack = doc['activitylist'];

    listOfImgAssets = doc['imageUrl'];

    if (listOfActivitiesToTrack.isNotEmpty && listOfRoutes.isNotEmpty) {
      setState(() {
        for (int i = 0; i < listOfActivitiesToTrack.length; i++) {
          detailsOfActivity.add(new ActivityDetails(
              activityName: listOfActivitiesToTrack[i],
              activityRoute: listOfRoutes[i],
              activityImgUrl: listOfImgAssets[i]));
        }
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
   var user = Provider.of<User>(context);

    return Padding(
      padding: EdgeInsets.only(left: 35, right: 35, top: 40, bottom: 40),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 35,
              ),
              Text(
               user.userName,
                
                style: TextStyle(color: Colors.white, fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                '''Add Activities That You Are Interested 
To Track For Carbon Emission''',
                style: TextStyle(fontSize: 14, color: Color(0xffFEBB46)),
              )
            ],
          ),
          noActivtyOptions == true
              ? SizedBox(
                  height: height * 0.3,
                )
              : SizedBox(
                  height: 10,
                ),
          noActivtyOptions == true
              ? CircularProgressIndicatorApp()
              : Expanded(
                  child: GridView(
                    children: detailsOfActivity
                        .map(
                          (e) => ActivityCard(
                            nameOfActivity: e.activityName,
                            routeOfActivity: e.activityRoute,
                            imageOfActivity: e.activityImgUrl,
                          ),
                        )
                        .toList(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: width * 0.5,
                      childAspectRatio: 7 / 8,
                      crossAxisSpacing: width * 0.04,
                      mainAxisSpacing: height * 0.02,
                    ),
                  ),
                ),
        ],
      ),
    );
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
