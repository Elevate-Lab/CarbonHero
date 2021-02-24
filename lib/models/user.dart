import 'package:carbon_emission/models/activity.dart';
import 'package:flutter/material.dart';

class User {
  String userId;
  String username;
  String emailId;
  String imgUrl;
  double savedCarbonEmission;
  List<Activity> userActivities;
  List<String> batchesEarned;
  int leaderBoardRank;
  int pointsEarned;

  User(
      {@required this.userId,
      @required this.username,
      @required this.emailId,
      @required this.imgUrl,
      @required this.savedCarbonEmission,
      @required this.userActivities,
      @required this.batchesEarned,
      @required this.leaderBoardRank,
      @required this.pointsEarned});
}
