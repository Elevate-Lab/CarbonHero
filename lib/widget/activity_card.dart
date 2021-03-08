import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  dynamic nameOfActivity;
  dynamic routeOfActivity;
  ActivityCard({this.nameOfActivity, this.routeOfActivity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // color: Colors.orange,
      child: Stack(children: [
        Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
            ),
            Container(
              height: 5,
              color: Colors.purple[200],
            ),
            Container(
              height: 50,
              padding: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  nameOfActivity,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ClipOval(
              child: Material(
                color: Colors.black,
                child: InkWell(
                  splashColor: Colors.purple[100], // inkwell color
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.add,
                        color: Colors.purple,
                        size: 40,
                      )),
                  onTap: () {
                    if (routeOfActivity != "NA")
                      Navigator.of(context).pushNamed(routeOfActivity);
                  },
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
