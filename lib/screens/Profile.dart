import 'package:carbon_emission/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
  static const routeName = '/ProfileScreen';
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: _height*0.45,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage('assets/Cover.png'),
                      fit: BoxFit.fill
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: _height*0.03,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black,
                            size: 25,
                          ),
                          Text(
                            "My Profile",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            Icons.border_color,
                            color: Colors.black,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: _width*0.3,
                      height: _height*0.19,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          image: new DecorationImage(
                              image: new NetworkImage(user.img_url),
                              fit: BoxFit.fill
                          ),
                          shape: BoxShape.circle
                      ),
                    ),
                    Text(
                      user.userName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: _height*0.345,
            child: Container(
              height: _height*0.1,
              width: _width*0.8,
              margin: EdgeInsets.fromLTRB(_width*0.1, _height*0.05, _width*0.1, 0),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xff281627),
                borderRadius: new BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "25",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Global Rank",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 35,
                    width: 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        user.total_carbon_emission_this_month.toStringAsFixed(1),
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "CO2 Emission",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}