import 'package:carbon_emission/widget/activity_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class chooseNewActivity extends StatefulWidget {
  static const routeName = '/chooseNewActivity';
  @override
  _chooseNewActivityState createState() => _chooseNewActivityState();
}

class _chooseNewActivityState extends State<chooseNewActivity> {
  final databaseReference = Firestore.instance;
  List<dynamic> listOfActivitiesToTrack;
  bool noActivtyOptions = false;

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
'''Add Activities That You Are Interested 
To Track For Carbon Emission''',
                  style: TextStyle(fontSize: 16, color: Color(0xffFEBB46)),
                )
              ],
            ),
            noActivtyOptions==true?SizedBox(height: height*0.3,):SizedBox(height: 10,),
            noActivtyOptions==true?
            Text(
              "No Activites To Add",
              style: TextStyle(color: Colors.white, fontSize: 32),
            ):
              Expanded(
              child: GridView(
                
                children: listOfActivitiesToTrack
                    .map((e) => ActivityCard(
                          nameOfActivity: e,
                        ))
                    .toList(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 7 / 8,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
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
