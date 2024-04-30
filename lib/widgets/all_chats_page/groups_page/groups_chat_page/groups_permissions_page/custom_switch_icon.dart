import 'package:sophiee/constants.dart';
import 'package:flutter/material.dart';

class CustomSwitchIcon extends StatelessWidget {
  const CustomSwitchIcon(
      {super.key,
      required this.size,
      required this.onChanged,
      required this.value});

  final Size size;
  final Function(bool) onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height * .02,
        width: size.height * .05,
        child: Switch(
            value: value,
            activeColor: Colors.white,
            activeTrackColor: kPrimaryColor,
            onChanged: onChanged));
  }
}
