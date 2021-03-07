import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Activity {
  String activityName;
  DateTime lastCheckedAt;
  int continuousStreak;
  double totalCarbonEmissionToday;
  double totalCarbonEmissionYesterday;
  double totalCarbonEmissionThisMonth;
  double totalCarbonEmissionLastMonth;

  Activity(
      {@required this.activityName,
      @required this.lastCheckedAt,
      @required this.continuousStreak,
      @required this.totalCarbonEmissionToday,
      @required this.totalCarbonEmissionYesterday,
      @required this.totalCarbonEmissionThisMonth,
      @required this.totalCarbonEmissionLastMonth});
}
