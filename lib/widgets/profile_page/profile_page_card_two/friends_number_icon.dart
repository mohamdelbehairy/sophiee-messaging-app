import 'package:sophiee/constants.dart';
import 'package:flutter/material.dart';

class FriendsNumberIcon extends StatelessWidget {
  const FriendsNumberIcon(
      {super.key, required this.size, required this.friendsNumber});
  final int friendsNumber;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: size.width * .03),
      child: CircleAvatar(
        radius: size.height * .03,
        backgroundColor: kPrimaryColor,
        child: Text(
          '+$friendsNumber',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
