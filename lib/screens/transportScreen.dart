import 'package:flutter/material.dart';

class Transport extends StatefulWidget {
  @override
  _TransportState createState() => _TransportState();
}

class _TransportState extends State<Transport> {
  var numVehicles = 0.00;
  var totalDistance = 0.00;
  var avgMileage = 0.00;
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        SizedBox(
          height: _height * 0.04,
        ),
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(bottom: _height * 0.03, right: _width * 0.04),
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
          padding: EdgeInsets.only(left: _width * 0.05),
          margin: EdgeInsets.only(left: 14, bottom: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: RichText(
                text: TextSpan(
                    text: "Transport",
                    style: TextStyle(color: Colors.white, fontSize: 25))),
          ),
        ),
        SizedBox(
          height: _height * 0.01,
        ),
        Container(
          width: _width * 0.9,
          padding: EdgeInsets.fromLTRB(_width * 0.01495, _height * 0.01495,
              _width * 0.01495, _height * 0.01495),
          margin: EdgeInsets.fromLTRB(_width * 0.02, 0, _width * 0.02, 0),
          decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(10), color: Colors.white),
          child: Row(
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.fromLTRB(_width * 0.03, _height * 0.02, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                            text: "Weekly Carbon Footprint",
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff281627)))),
                    SizedBox(
                      height: _height * 0.01,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "241 Kg",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xff281627),
                                fontWeight: FontWeight.w900))),
                  ],
                ),
              ),
              Spacer(),
              Image(
                width: _width * 0.26,
                height: _height * 0.12,
                image: AssetImage('assets/transport.png'),
              ),
              SizedBox(width: _width * 0.02)
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: _width,
            padding: EdgeInsets.all(20),
            //   height: _height*0.53,
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Colors.white),
            margin: EdgeInsets.fromLTRB(0, _height * 0.04, 0, 0),

            child: SingleChildScrollView(
                          child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Number of personal vehicles',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: _height * 0.03,
                  ),
                  Container(
                    width: _width * 0.8,
                    height: _height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(10),
                      color: const Color(0xff281627),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(children: [
                        Text(
                          "0",
                          style: TextStyle(color: Colors.white),
                        ),
                        Expanded(
                          child: SliderTheme(
                            data: SliderThemeData(
                              //  activeTrackColor: Colors.red[700],
                              inactiveTrackColor: const Color(0xff281627),
                              trackShape: RoundedRectSliderTrackShape(),
                              trackHeight: 10.0,
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 12.0),
                              thumbColor: const Color(0xffFEBB46),
                              overlayColor: Colors.black,
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 28.0),
                              tickMarkShape: RoundSliderTickMarkShape(),
                              activeTickMarkColor: Colors.white,
                              inactiveTickMarkColor: Colors.white,
                              valueIndicatorShape:
                                  PaddleSliderValueIndicatorShape(),
                              valueIndicatorColor: Colors.redAccent,
                              valueIndicatorTextStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            child: Slider(
                              label: "$numVehicles",
                              value: numVehicles,
                              min: 0,
                              max: 10,
                              divisions: 10,
                              activeColor: const Color(0xffFEBB46),
                              onChanged: (double value) {
                                setState(() {
                                  numVehicles = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Text(
                          "10",
                          style: TextStyle(color: Colors.white),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(height: _height * 0.02),
                  new Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(height: _height * 0.02),
                  Text(
                    'Kilometer,travelled this week(km)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: _height * 0.04,
                  ),
                  Container(
                    width: _width * 0.8,
                    height: _height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(10),
                      color: const Color(0xff281627),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(children: [
                        Text(
                          "0",
                          style: TextStyle(color: Colors.white),
                        ),
                        Expanded(
                          child: SliderTheme(
                            data: SliderThemeData(
                              //  activeTrackColor: Colors.red[700],
                              inactiveTrackColor: const Color(0xff281627),
                              trackShape: RoundedRectSliderTrackShape(),
                              trackHeight: _height * 0.01,
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 12.0),
                              thumbColor: const Color(0xffFEBB46),
                              overlayColor: Colors.black,
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 28.0),
                              tickMarkShape: RoundSliderTickMarkShape(),
                              activeTickMarkColor: Colors.white,
                              inactiveTickMarkColor: Colors.white,
                              valueIndicatorShape:
                                  PaddleSliderValueIndicatorShape(),
                              //     valueIndicatorColor: Colors.redAccent,
                              valueIndicatorTextStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            child: Slider(
                              label: "$totalDistance",
                              value: totalDistance,
                              min: 0,
                              max: 2000,
                              divisions: 10,
                              activeColor: const Color(0xffFEBB46),
                              onChanged: (double value) {
                                setState(() {
                                  totalDistance = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Text(
                          "2000",
                          style: TextStyle(color: Colors.white),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(height: _height * 0.02),
                  new Divider(
                    color: Colors.grey,
                  ),
                    SizedBox(height: _height * 0.02),
                  Text(
                    'Average mileage of your vehicle (km/L) ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: _height * 0.04,
                  ),
                  Container(
                    width: _width * 0.8,
                    height: _height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(10),
                      color: const Color(0xff281627),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(children: [
                        Text(
                          "0",
                          style: TextStyle(color: Colors.white),
                        ),
                        Expanded(
                          child: SliderTheme(
                            data: SliderThemeData(
                              //  activeTrackColor: Colors.red[700],
                              inactiveTrackColor: const Color(0xff281627),
                              trackShape: RoundedRectSliderTrackShape(),
                              trackHeight: _height * 0.01,
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 12.0),
                              thumbColor: const Color(0xffFEBB46),
                              overlayColor: Colors.black,
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 28.0),
                              tickMarkShape: RoundSliderTickMarkShape(),
                              activeTickMarkColor: Colors.white,
                              inactiveTickMarkColor: Colors.white,
                              valueIndicatorShape:
                                  PaddleSliderValueIndicatorShape(),
                              //     valueIndicatorColor: Colors.redAccent,
                              valueIndicatorTextStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            child: Slider(
                              label: "$avgMileage",
                              value: avgMileage,
                              min: 0,
                              max: 2000,
                              divisions: 10,
                              activeColor: const Color(0xffFEBB46),
                              onChanged: (double value) {
                                setState(() {
                                  avgMileage = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Text(
                          "2000",
                          style: TextStyle(color: Colors.white),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
