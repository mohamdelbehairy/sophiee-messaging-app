import 'package:sophiee/constants.dart';
import 'package:flutter/material.dart';

class GroupsChatAddMemberButton extends StatelessWidget {
  const GroupsChatAddMemberButton(
      {super.key, required this.size, required this.onTap});
  final Size size;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(right: size.width * .03, bottom: size.height * .03),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: size.height * .035,
              backgroundColor: kPrimaryColor,
              child: Icon(Icons.done,
                  color: Colors.white, size: size.height * .033),
            ),
          ],
        ),
      ),
    );
  }
}
