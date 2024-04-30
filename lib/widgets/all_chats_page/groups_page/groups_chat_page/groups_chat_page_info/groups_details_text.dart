import 'package:flutter/material.dart';

class GroupsDetailsText extends StatelessWidget {
  const GroupsDetailsText({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .04),
      child: Text('Group Details',
          style: TextStyle(
              color: Colors.black,
              fontSize: size.height * .02,
              fontWeight: FontWeight.normal)),
    );
  }
}
