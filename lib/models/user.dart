import 'package:flutter/material.dart';

class User {
  String userId;
  String userName;
  String emailId;
  String imgUrl;
  double savedCarbonEmission;
  double totalCarbonEmissionThisMonth;
  double totalCarbonEmissionLastMonth;
  double totalCarbonEmissionYesterday;
  double totalCarbonEmissionToday;
  List<String> batchesEarned;
  int pointsEarned;
  List<String> userFriends;

  User({
    @required this.userId,
    @required this.userName,
    @required this.emailId,
    @required this.imgUrl,
    @required this.savedCarbonEmission,
    @required this.totalCarbonEmissionThisMonth,
    @required this.totalCarbonEmissionLastMonth,
    @required this.totalCarbonEmissionYesterday,
    @required this.totalCarbonEmissionToday,
    @required this.batchesEarned,
    @required this.pointsEarned,
    @required this.userFriends,
  });
}
