import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final badgeName;

  Badge(this.badgeName);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: ActionChip(
          elevation: 8.0,
          padding: EdgeInsets.all(2.0),
          label: Text('$badgeName'),
          onPressed: () {},
          backgroundColor: const Color(0xffFEBB46),
          shape: StadiumBorder(),
        ));
  }
}
