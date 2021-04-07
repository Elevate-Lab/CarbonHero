import 'package:carbon_emission/widget/Leaderboard.dart';
import 'package:carbon_emission/widget/dashBoard.dart';
import 'package:carbon_emission/widget/statistics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/MainScreen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final databaseReference = Firestore.instance;
  var user;
  Future<void> _checkMonth() async {

    DateTime today = DateTime.now();
    if (user.date.month != today.month) {
      user.total_carbon_emission_last_month =
          user.total_carbon_emission_this_month;
      user.total_carbon_emission_this_month = 0.0;
      user.total_carbon_emission_yesterday = user.total_carbon_emission_today;
      user.total_carbon_emission_today = 0.0;
    } else if (user.date.day != today.day) {
      user.total_carbon_emission_yesterday = user.total_carbon_emission_today;
      user.total_carbon_emission_today = 0.0;
    }

    await databaseReference
        .collection("users")
        .document(user.email_id)
        .updateData({
      'totalCarbonEmissionToday': user.total_carbon_emission_today,
      'totalCarbonEmissionThisMonth': user.total_carbon_emission_this_month,
      'totalCarbonEmissionLastMonth': user.total_carbon_emission_last_month,
      'totalCarbonEmissionYesterday': user.total_carbon_emission_yesterday,
      'lastCheckedAt': DateTime.now(),
    });

    var doc = await databaseReference
        .collection("users")
        .document(user.email_id)
        .collection("activities")
        .document("Natural Gas")
        .get();
    double activityToday = doc['totalCarbonEmissionToday'].toDouble();
    double activityThisMonth = doc['totalCarbonEmissionThisMonth'].toDouble();
    double activityYesterday = doc['totalCarbonEmissionYesterday'].toDouble();
    double activityPrevMonth = doc['totalCarbonEmissionLastMonth'].toDouble();

    if (today.month != user.date.month) {
      activityPrevMonth = activityThisMonth;
      activityThisMonth = 0.0;
      activityYesterday = activityToday;
      activityToday = 0.0;
    } else if (today.day != user.date.day) {
      activityYesterday = activityToday;
      activityToday = 0.0;
    }
    await databaseReference
        .collection("users")
        .document(user.email_id)
        .collection("activities")
        .document("Natural Gas")
        .updateData({
      'totalCarbonEmissionToday': activityToday,
      'totalCarbonEmissionThisMonth': activityThisMonth,
      'totalCarbonEmissionYesterday': activityYesterday,
      'totalCarbonEmissionLastMonth': activityPrevMonth,
      'lastCheckedAt': DateTime.now(),
    });

    doc = await databaseReference
        .collection("users")
        .document(user.email_id)
        .collection("activities")
        .document("Electricity")
        .get();
    activityToday = doc['totalCarbonEmissionToday'].toDouble();
    activityThisMonth = doc['totalCarbonEmissionThisMonth'].toDouble();
    activityYesterday = doc['totalCarbonEmissionYesterday'].toDouble();
    activityPrevMonth = doc['totalCarbonEmissionLastMonth'].toDouble();

    if (today.month != user.date.month) {
      activityPrevMonth = activityThisMonth;
      activityThisMonth = 0.0;
      activityYesterday = activityToday;
      activityToday = 0.0;
    } else if (today.day != user.date.day) {
      activityYesterday = activityToday;
      activityToday = 0.0;
    }
    await databaseReference
        .collection("users")
        .document(user.email_id)
        .collection("activities")
        .document("Electricity")
        .updateData({
      'totalCarbonEmissionToday': activityToday,
      'totalCarbonEmissionThisMonth': activityThisMonth,
      'totalCarbonEmissionYesterday': activityYesterday,
      'totalCarbonEmissionLastMonth': activityPrevMonth,
      'lastCheckedAt': DateTime.now(),
    });

    doc = await databaseReference
        .collection("users")
        .document(user.email_id)
        .collection("activities")
        .document("Home Appliances")
        .get();
    activityToday = doc['totalCarbonEmissionToday'].toDouble();
    activityThisMonth = doc['totalCarbonEmissionThisMonth'].toDouble();
    activityYesterday = doc['totalCarbonEmissionYesterday'].toDouble();
    activityPrevMonth = doc['totalCarbonEmissionLastMonth'].toDouble();

    if (today.month != user.date.month) {
      activityPrevMonth = activityThisMonth;
      activityThisMonth = 0.0;
      activityYesterday = activityToday;
      activityToday = 0.0;
    } else if (today.day != user.date.day) {
      activityYesterday = activityToday;
      activityToday = 0.0;
    }
    await databaseReference
        .collection("users")
        .document(user.email_id)
        .collection("activities")
        .document("Home Appliances")
        .updateData({
      'totalCarbonEmissionToday': activityToday,
      'totalCarbonEmissionThisMonth': activityThisMonth,
      'totalCarbonEmissionYesterday': activityYesterday,
      'totalCarbonEmissionLastMonth': activityPrevMonth,
      'lastCheckedAt': DateTime.now(),
    });

    doc = await databaseReference
        .collection("users")
        .document(user.email_id)
        .collection("activities")
        .document("Television")
        .get();
    activityToday = doc['totalCarbonEmissionToday'].toDouble();
    activityThisMonth = doc['totalCarbonEmissionThisMonth'].toDouble();
    activityYesterday = doc['totalCarbonEmissionYesterday'].toDouble();
    activityPrevMonth = doc['totalCarbonEmissionLastMonth'].toDouble();

    if (today.month != user.date.month) {
      activityPrevMonth = activityThisMonth;
      activityThisMonth = 0.0;
      activityYesterday = activityToday;
      activityToday = 0.0;
    } else if (today.day != user.date.day) {
      activityYesterday = activityToday;
      activityToday = 0.0;
    }
    await databaseReference
        .collection("users")
        .document(user.email_id)
        .collection("activities")
        .document("Television")
        .updateData({
      'totalCarbonEmissionToday': activityToday,
      'totalCarbonEmissionThisMonth': activityThisMonth,
      'totalCarbonEmissionYesterday': activityYesterday,
      'totalCarbonEmissionLastMonth': activityPrevMonth,
      'lastCheckedAt': DateTime.now(),
    });

    doc = await databaseReference
        .collection("users")
        .document(user.email_id)
        .collection("activities")
        .document("Personal Vehicle")
        .get();
    activityToday = doc['totalCarbonEmissionToday'].toDouble();
    activityThisMonth = doc['totalCarbonEmissionThisMonth'].toDouble();
    activityYesterday = doc['totalCarbonEmissionYesterday'].toDouble();
    activityPrevMonth = doc['totalCarbonEmissionLastMonth'].toDouble();

    if (today.month != user.date.month) {
      activityPrevMonth = activityThisMonth;
      activityThisMonth = 0.0;
      activityYesterday = activityToday;
      activityToday = 0.0;
    } else if (today.day != user.date.day) {
      activityYesterday = activityToday;
      activityToday = 0.0;
    }
    await databaseReference
        .collection("users")
        .document(user.email_id)
        .collection("activities")
        .document("Personal Vehicle")
        .updateData({
      'totalCarbonEmissionToday': activityToday,
      'totalCarbonEmissionThisMonth': activityThisMonth,
      'totalCarbonEmissionYesterday': activityYesterday,
      'totalCarbonEmissionLastMonth': activityPrevMonth,
      'lastCheckedAt': DateTime.now(),
    });

    doc = await databaseReference
        .collection("users")
        .document(user.email_id)
        .collection("activities")
        .document("Waste")
        .get();
    activityToday = doc['totalCarbonEmissionToday'].toDouble();
    activityThisMonth = doc['totalCarbonEmissionThisMonth'].toDouble();
    activityYesterday = doc['totalCarbonEmissionYesterday'].toDouble();
    activityPrevMonth = doc['totalCarbonEmissionLastMonth'].toDouble();

    if (today.month != user.date.month) {
      print('Waste Month Changed');
      activityPrevMonth = activityThisMonth;
      activityThisMonth = 0.0;
      activityYesterday = activityToday;
      activityToday = 0.0;
    } else if (today.day != user.date.day) {
      activityYesterday = activityToday;
      activityToday = 0.0;
    }
    await databaseReference
        .collection("users")
        .document(user.email_id)
        .collection("activities")
        .document("Waste")
        .updateData({
      'totalCarbonEmissionToday': activityToday,
      'totalCarbonEmissionThisMonth': activityThisMonth,
      'totalCarbonEmissionYesterday': activityYesterday,
      'totalCarbonEmissionLastMonth': activityPrevMonth,
      'lastCheckedAt': DateTime.now(),
    });

    user.date = DateTime.now();

  }

  @override
  void initState() {
    super.initState();
    user = Provider.of<User>(context, listen: false);
    _checkMonth();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff281627),
      body: (_currentIndex == 0
          ? DashBoard()
          : (_currentIndex == 1 ? LeaderBoard() : Statistics())),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
            ),
            title: Text('LeaderBoard'),
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
