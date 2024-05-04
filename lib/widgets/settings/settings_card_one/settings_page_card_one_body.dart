import 'package:flutter/material.dart';
import 'package:sophiee/widgets/settings/settings_card_one/card_one_body_component.dart';

class SettingsPageCardOneBody extends StatelessWidget {
  const SettingsPageCardOneBody(
      {super.key,
      required this.size,
      required this.onPressed,
      required this.onChanged, required this.value});

  final Size size;
  final Function() onPressed;
  final Function(bool) onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * .37,
        width: size.width,
        decoration: const BoxDecoration(
            color: Colors.transparent,
            boxShadow: [BoxShadow(blurRadius: 0, color: Colors.transparent)]),
        child: CardOneBodyComponenet(
          value: value,
            size: size, onPressed: onPressed, onChanged: onChanged));
  }
}
