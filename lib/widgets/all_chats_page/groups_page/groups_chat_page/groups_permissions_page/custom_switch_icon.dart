import 'package:sophiee/constants.dart';
import 'package:flutter/material.dart';

class CustomSwitchIcon extends StatelessWidget {
  const CustomSwitchIcon(
      {super.key,
      required this.size,
      required this.onChanged,
      required this.value,
      this.height});

  final Size size;
  final Function(bool) onChanged;
  final bool value;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? size.height * .02,
        width: size.height * .05,
        child: Switch(
            value: value,
            activeColor: Colors.white,
            activeTrackColor: kPrimaryColor,
            trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
            // inactiveThumbColor: const Color(0xff1E1E1E),
            onChanged: onChanged));
  }
}
