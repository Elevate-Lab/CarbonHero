import 'package:flutter/material.dart';

class Waste extends StatefulWidget {
  @override
  _WasteState createState() => _WasteState();
}

class _WasteState extends State<Waste> {

  var titles = ["Waste generated this month (kg)", "Paper recycled this month (kg)", "Plastic recycled this month (kg)", "Glass recycled this month (kg)", "Metal recycled this month (kg)"];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:  Color(0xff281627),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: _height*0.04,
          ),
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(bottom: _height*0.03, right: _width*0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                  size: 35,
                ),
                Icon(
                  Icons.account_circle_rounded,
                  color: Colors.white,
                  size: 35,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 14, bottom: 10),
            child: RichText(
                text: TextSpan(
                    text: "Waste Generated",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                    )
                )
            ),
          ),
          SizedBox(
            height: _height*0.01,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(_width*0.01495, _height*0.01495, _width*0.01495, _height*0.01495),
            margin: EdgeInsets.fromLTRB(_width*0.02, 0, _width*0.02, _height*0.045),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(10),
                color: Colors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(_width*0.03, _height*0.02, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                              text: "Weekly Carbon Footprint",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff281627)
                              )
                          )
                      ),
                      SizedBox(
                        height: _height*0.01,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "15 Kg",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xff281627),
                                  fontWeight: FontWeight.w900
                              )
                          )
                      ),
                    ],
                  ),
                ),
                Image(
                  width: _width*0.29,
                  height: _height*0.12,
                  image: AssetImage('assets/waste.png'),
                ),
              ],
            ),
          ),
          Container(
            width: _width,
            height: _height*0.525,
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                color: Colors.white
            ),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, ind){
                return Container(
                      padding: EdgeInsets.symmetric(vertical: _height*0.02, horizontal: _width*0.024),
                      margin: EdgeInsets.symmetric(vertical: _height*0.011, horizontal: _width*0.03),
                      color: const Color(0xffF6EEE3),
                      height: _height*0.15,
                      // A fixed-height child.
                      child: Column(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                                text: titles[ind],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff281627),
                                )
                            )
                          ),
                          SizedBox(
                            height: _height*0.025,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.remove_circle_outlined,
                                size: 30,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "15",
                                      style: TextStyle(
                                        fontSize: 35,
                                        color: Color(0xff281627),
                                        fontWeight: FontWeight.bold,
                                      )
                                  )
                              ),
                              Icon(
                                Icons.add_circle_outlined,
                                size: 30,
                              ),
                            ],
                          ),
                        ]
                      ),
                    );
                },
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        //currentIndex: _currentIndex,
        //onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text('Home')
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart,
              ),
              title: Text('LeaderBoard')
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.leaderboard,
              ),
              title: Text('Chart'))
        ],
      ),
    );
  }
}