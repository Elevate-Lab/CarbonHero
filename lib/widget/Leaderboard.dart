import 'package:flutter/material.dart';

class LeaderBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.all(20),
                //   height: _height*0.53,
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    color: Colors.white),
                margin: EdgeInsets.fromLTRB(0, height * 0.04, 0, 0),
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
              backgroundImage: AssetImage('assets/electricity.png'),
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
            "Rayan Singh",
            style: TextStyle(color: Colors.white, fontSize: width * 0.045),
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
              backgroundImage: AssetImage('assets/electricity.png'),
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
            "Rayan Singh",
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
              backgroundImage: AssetImage('assets/electricity.png'),
            ),
          ),
        ),
        Positioned(
          bottom: height * 0.66,
          right: width * 0.084,
          child: CircleAvatar(
              radius: width * 0.025,
              backgroundColor:  const Color(0xffA48FD1),
              child: Text(
                "3",
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
        ),

        Positioned(
          bottom: height * 0.57,
          right:  width* 0.08,

          child: Text(
            "Rayan Singh",
            style: TextStyle(color: Colors.white, fontSize: width * 0.03),
          ),
        ),
      ],
    );
  }
}
