import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String userId;
  String userName;
  String emailId;
  String imgUrl;
  double savedCarbonEmission;
  double totalCarbonEmissionThisMonth;
  double totalCarbonEmissionLastMonth;
  double totalCarbonEmissionYesterday;
  double totalCarbonEmissionToday;
  List<dynamic> batchesEarned;
  int pointsEarned;
  List<dynamic> userFriends;

  // User({
  //   @required this.userId,
  //   @required this.userName,
  //   @required this.emailId,
  //   @required this.imgUrl,
  //   @required this.savedCarbonEmission,
  //   @required this.totalCarbonEmissionThisMonth,
  //   @required this.totalCarbonEmissionLastMonth,
  //   @required this.totalCarbonEmissionYesterday,
  //   @required this.totalCarbonEmissionToday,
  //   @required this.batchesEarned,
  //   @required this.pointsEarned,
  //   @required this.userFriends,
  // });

  set name(String _username) {
    this.userName = _username;
    notifyListeners();
  }

  set id(String _userId) {
    this.userId = _userId;
    notifyListeners();
  }

  set email_id(String _useremailId) {
    this.emailId = _useremailId;
    notifyListeners();
  }

  set img_url(String _imgUrl) {
    this.imgUrl = _imgUrl;
    notifyListeners();
  }

  set saved_carbon_emission(double _savedcarbonemission) {
    this.savedCarbonEmission = _savedcarbonemission;
    notifyListeners();
  }

  set total_carbon_emission_this_month(double _totalcarbonemissionthismonth) {
    this.totalCarbonEmissionThisMonth = _totalcarbonemissionthismonth;
    notifyListeners();
  }

  set total_carbon_emission_last_month(double _totalcarbonemissionlastmonth) {
    this.totalCarbonEmissionThisMonth = _totalcarbonemissionlastmonth;
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

  set points_earned(int _pointsearned) {
    this.pointsEarned = _pointsearned;
    notifyListeners();
  }

  set batches_earned(List<dynamic> _batchesearned) {
    this.batchesEarned = _batchesearned;
    notifyListeners();
  }

  set user_friends(List<dynamic> _userfriends) {
    this.userFriends = _userfriends;
    notifyListeners();
  }

  String get name {
    return this.userName;
  }

  String get id {
    return this.userId;
  }

  String get email_id {
    return this.emailId;
  }

  String get img_url {
    return this.imgUrl;
  }

  double get saved_carbon_emission {
    return this.savedCarbonEmission;
  }

  double get total_carbon_emission_last_month {
    return this.totalCarbonEmissionLastMonth;
  }

  double get total_carbon_emission_this_month {
    return this.totalCarbonEmissionThisMonth;
  }

  double get total_carbon_emission_today {
    return this.totalCarbonEmissionToday;
  }

  double get total_carbon_emission_yesterday {
    return this.totalCarbonEmissionYesterday;
  }

  int get points_earned {
    return this.pointsEarned;
  }

  List<dynamic> get batches_earned {
    return this.batchesEarned;
  }

  List<dynamic> get user_friends {
    return this.user_friends;
  }
}
