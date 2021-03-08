import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Activity with ChangeNotifier {
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

  set activity_name(String _activityname) {
    this.activityName = _activityname;
    notifyListeners();
  }

  set last_checked_at(DateTime _lastcheckedat) {
    this.lastCheckedAt = _lastcheckedat;
    notifyListeners();
  }

  set continuous_streak(int _continuousstreak) {
    this.continuousStreak = _continuousstreak;
    notifyListeners();
  }

  set total_carbon_emission_today(double _totalcarbonemissiontoday) {
    this.totalCarbonEmissionToday = _totalcarbonemissiontoday;
    notifyListeners();
  }

  set total_carbon_emission_yesterday(double _totalcarbonemissionyesterday) {
    this.totalCarbonEmissionYesterday = _totalcarbonemissionyesterday;
    notifyListeners();
  }

  set total_carbon_emission_last_month(double _totalcarbonemissionlastmonth) {
    this.totalCarbonEmissionLastMonth = _totalcarbonemissionlastmonth;
    notifyListeners();
  }

  set total_carbon_emission_this_month(double _totalcarbonemissionthismonth) {
    this.totalCarbonEmissionThisMonth = _totalcarbonemissionthismonth;
    notifyListeners();
  }

  String get activity_name {
    return this.activityName;
  }

  DateTime get last_checked_at {
    return this.lastCheckedAt;
  }

  int get continuous_streak {
    return this.continuousStreak;
  }

  double get total_carbon_emission_today {
    return this.totalCarbonEmissionToday;
  }

  double get total_carbon_emission_yesterday {
    return this.totalCarbonEmissionYesterday;
  }

  double get total_carbon_emission_this_month {
    return this.totalCarbonEmissionThisMonth;
  }

  double get total_carbon_emission_last_month {
    return this.totalCarbonEmissionLastMonth;
  }
}
