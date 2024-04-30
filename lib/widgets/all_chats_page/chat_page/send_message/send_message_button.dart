import 'package:sophiee/constants.dart';
import 'package:flutter/material.dart';

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({super.key, required this.icon, required this.onTap});
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 25,
          backgroundColor: kPrimaryColor,
          child: Icon(icon, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}
