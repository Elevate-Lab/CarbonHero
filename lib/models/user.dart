import 'package:flutter/material.dart';

class User with ChangeNotifier{
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

  set f(String name){
    this.userName = name;
    notifyListeners();
  }
  String get name {
    print("679t");
    print(this.userName);
    return this.userName;
  }
}
