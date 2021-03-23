import 'package:flutter/material.dart';

class LeaderBoardCard extends StatelessWidget {
  
  final userName;
  final imgPath;
  final totalContributions;
  final hasIncreased;
  final rank;
  LeaderBoardCard(this.imgPath,this.userName,this.totalContributions,this.rank,this.hasIncreased);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column
      (
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: width*0.07,
                      backgroundColor: const Color(0xffA48FD1),
                      backgroundImage: NetworkImage(imgPath),
                    ),
                    SizedBox(
                      width: width*0.04,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$userName",
                          style: TextStyle(
                              fontSize: width*0.045
                          ),
                        ),
                        Text(
                          '''$totalContributions Points Scored by the user''',
                          style: TextStyle(
                              fontSize: width*0.027
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  "$rank",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(height: height*0.02,)
          ]
    );
  }
}

// Widget Up()
// {
//    return Icon(
//                 Icons.arrow_circle_up,
//                 color: Colors.green,
//
//               );
// }
//
// Widget Down()
// {
//    return Icon(
//                 Icons.arrow_circle_down,
//                 color: Colors.red,
//
//               );
// }