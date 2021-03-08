import 'dart:ui';

import 'package:carbon_emission/models/user.dart';
import 'package:carbon_emission/screens/chooseNewActivity.dart';
import 'package:carbon_emission/widget/badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    print(Provider.of<User>(context).name);
    print(user.name);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 35,
          right: 35,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  user.name,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Spacer(),
                Icon(
                  Icons.account_circle_outlined,
                  size: 40,
                  color: Colors.white,
                )
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Your carbon emission is going well\n ",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            Row(
              children: [
                Badge("11212ewewe"),
                Badge("11212"),
                Badge("11212"),
              ],
            ),
            SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  showLabels: false,
                  showTicks: false,
                  startAngle: 180,
                  endAngle: 0,
                  radiusFactor: 0.8,
                  canScaleToFit: true,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.1,
                    color: Colors.white,
                    thicknessUnit: GaugeSizeUnit.factor,
                    cornerStyle: CornerStyle.startCurve,
                  ),
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      positionFactor: 0.1,
                      angle: 90,
                      widget: Column(
                        children: [
                          SizedBox(
                            height: 75,
                          ),
                          Text(
                            "240 Kg",
                            style: TextStyle(
                                color: const Color(0xffFEBB46), fontSize: 39),
                          ),
                          Text("of CO2 has been emitted this",
                              style: TextStyle(
                                  color: const Color(0xffFEBB46),
                                  fontSize: 14)),
                          Text("emitted ",
                              style: TextStyle(
                                  color: const Color(0xffFEBB46),
                                  fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                  pointers: <GaugePointer>[
                    RangePointer(
                        color: const Color(0xffFEBB46),
                        value: 70,
                        width: 0.1,
                        sizeUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve)
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      " -9%",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "CO2 this",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "month",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  height: 55,
                  width: 2,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Text(
                      " +2%",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "CO2 from",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "yesterday",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "We have a single mission: to protect and",
              style: TextStyle(color: const Color(0xffFEBB46), fontSize: 14),
            ),
            Text(
              "hand on the planet to the next",
              style: TextStyle(color: const Color(0xffFEBB46), fontSize: 14),
            ),
            Text(
              "generation",
              style: TextStyle(color: const Color(0xffFEBB46), fontSize: 14),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              textColor: Colors.white,
              color: const Color(0xffA663C6),
              child: Container(
                width: width * 0.4,
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    Text(
                      " Add CO2 sources",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(chooseNewActivity.routeName);
              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ],
        ));
  }
}
