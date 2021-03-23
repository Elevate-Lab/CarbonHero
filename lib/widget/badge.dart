import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final badgeName;

  Badge(this.badgeName);
  @override
  Widget build(BuildContext context) {
    return
        Chip(
          elevation: 8.0,
          padding: EdgeInsets.all(2.0),
          label: Text('$badgeName'),
         
          backgroundColor: const Color(0xffFEBB46),
          shape: StadiumBorder(),
        );
  }
}
