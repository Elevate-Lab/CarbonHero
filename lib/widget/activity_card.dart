import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  dynamic nameOfActivity;
  dynamic routeOfActivity;
  dynamic imageOfActivity;
  ActivityCard(
      {this.nameOfActivity, this.routeOfActivity, this.imageOfActivity});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.01,
      //color: Colors.orange,
      child: Stack(children: [
        Column(
          children: [
            Container(
              height: height * 0.12,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(imageOfActivity),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width * 0.04),
                      topRight: Radius.circular(width * 0.04))),
            ),
            Container(
              height: height * 0.008,
              color: Colors.purple[200],
            ),
            Container(
              height: height * 0.06,
              padding: EdgeInsets.only(top: height * 0.001),
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(width * 0.04),
                  bottomRight: Radius.circular(width * 0.04),
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
          padding: const EdgeInsets.only(top: 5.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ClipOval(
              child: Material(
                color: Colors.black,
                child: InkWell(
                  splashColor: Colors.purple[100], // inkwell color
                  child: SizedBox(
                      width: width * 0.12,
                      height: height * 0.06,
                      child: Icon(
                        Icons.add,
                        color: Colors.purple,
                        size: width * 0.1,
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
