import 'package:flutter/material.dart';

class LeaderBoardDetails {
  String username;
  int userPoints;
  String imgUrl;
  int leaderBoardRank;
  String email;

  LeaderBoardDetails(
      {
        @required this.username,
        @required this.userPoints,
        @required this.imgUrl,
        @required this.leaderBoardRank,
        @required this.email
      }
      );
}
