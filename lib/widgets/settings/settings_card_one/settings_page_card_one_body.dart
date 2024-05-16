import 'package:flutter/material.dart';
import 'package:sophiee/widgets/settings/settings_card_one/card_one_body_component.dart';

class SettingsPageCardOneBody extends StatelessWidget {
  const SettingsPageCardOneBody(
      {super.key, required this.size, required this.onPressed});

  final Size size;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * .36,
        width: size.width,
        decoration: const BoxDecoration(
            color: Colors.transparent,
            boxShadow: [BoxShadow(blurRadius: 0, color: Colors.transparent)]),
        child: CardOneBodyComponenet(size: size, onPressed: onPressed));
  }
}
