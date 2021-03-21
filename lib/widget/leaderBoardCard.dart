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
    return Column(
          children:[ Row(
        children: [
          CircleAvatar(
            radius: width * 0.07,
            backgroundColor: const Color(0xffA48FD1),
            backgroundImage: AssetImage('assets/electricity.png'),
          ),
          SizedBox(
            width: width * 0.075,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [    
              Text("$userName",
              style: TextStyle(
                fontSize: width*0.06
              ),
              
              )
              , Text('''$totalContributions kg C02 emission last
 week''',
               style: TextStyle(
                fontSize: width*0.027
              ),
              )],
          ),
            SizedBox(
            width: width * 0.2,
          ),
          Column(
            children: [
              Text("$rank"),
            hasIncreased==true?Up():Down(),
            
            ],
          )

        ],
      ),
      SizedBox(height: height*0.02,)
           ] );
  }
}

Widget Up()
{
   return Icon(
                Icons.arrow_circle_up,
                color: Colors.green,
                
              );
}

Widget Down()
{
   return Icon(
                Icons.arrow_circle_down,
                color: Colors.red,
                
              );
}