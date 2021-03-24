import 'package:flutter/material.dart';
import 'package:carbon_emission/screens/login.dart';

import 'package:carbon_emission/screens/splashScreen2.dart';

class SplashScreen1 extends StatelessWidget {
  static const routeName = '/splashScreen1';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff281627),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 40, left: 35, right: 35, bottom: 40),
        child: Column(
          children: [
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(LogIn.routeName);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              height: height * 0.35,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/splash_screen_1.png"),
                      fit: BoxFit.fitHeight)),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Track",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '''Track your carbon emission
easily with and automatically with our simple tracker.''',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Container(
                  height: height * 0.01,
                  width: width * 0.08,
                  decoration: BoxDecoration(
                      color: Color(0xffA663C6),
                      border: Border.all(
                        color: Color(0xffA663C6),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                SizedBox(
                  width: width * 0.015,
                ),
                Container(
                  height: height * 0.01,
                  width: width * 0.08,
                  decoration: BoxDecoration(
                      color: Color(0xffC4C4C4),
                      border: Border.all(
                        color: Color(0xffC4C4C4),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(SplashScreen2.routeName);
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: Color(0xffFEBB46),
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
