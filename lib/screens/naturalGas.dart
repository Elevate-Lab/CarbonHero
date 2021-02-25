import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class NaturalGas extends StatefulWidget {
  @override
  _NaturalGasState createState() => _NaturalGasState();
}

class _NaturalGasState extends State<NaturalGas> {
  @override
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
                    text: "Natural Gas",
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
            margin: EdgeInsets.fromLTRB(_width*0.02, 0, _width*0.02, 0),
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
                              text: "241 Kg",
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
                  image: AssetImage('assets/Natural gas.png'),
                ),
              ],
            ),
          ),
          Container(
              width: _width,
              height: _height*0.53,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                  color: Colors.white
              ),
              margin: EdgeInsets.fromLTRB(0, _height*0.04, 0, 0),
              child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(_width*0.07, _height*0.06, _width*0.07, _height*0.02),
                      child: RichText(
                          text: TextSpan(
                            text: "Number of gas cylinders used in a month",
                            style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff281627),
                              fontWeight: FontWeight.w800,
                            ),
                          )
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: SleekCircularSlider(
                        appearance: CircularSliderAppearance(
                          startAngle: 165,
                          angleRange: 210,
                          size: 230,
                          customWidths: CustomSliderWidths(
                              progressBarWidth: 30
                          ),
                          customColors: CustomSliderColors(
                              trackColor: Colors.white,
                              shadowColor: Colors.white,
                              dotColor: Colors.white,
                              progressBarColor: Color(0xff281627)
                          ),
                        ),
                        min: 0,
                        max: 12,
                        initialValue: 5,
                        onChange: (double value) {
                          print(value);
                        },
                        innerWidget: (double value){
                          String percentageModifier(double value) {
                            final roundedValue = value.ceil().toInt().toString();
                            return '$roundedValue';
                          }
                          return Container(
                            margin: EdgeInsets.fromLTRB(_width*0.25, _height*0.1, 0, 0),
                            // child: Text(
                            //     percentageModifier(value),
                            //     style: TextStyle(
                            //       color: Color(0xff281627),
                            //         fontSize: 45,
                            //         fontWeight: FontWeight.w800
                            //     )
                            // )
                            child: RichText(
                              text: TextSpan(
                                  text: percentageModifier(value),
                                  style: TextStyle(
                                      color: Color(0xff281627),
                                      fontSize: 45,
                                      fontWeight: FontWeight.w800
                                  )
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ]
              )
          ),
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