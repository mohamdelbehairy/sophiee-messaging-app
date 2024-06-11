import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../utils/initial_state.dart';

class ContactIconClose extends StatelessWidget {
  const ContactIconClose({super.key, required this.size, required this.isDark});

  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: size.height * .01,
        left: size.width * .01,
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              InitialState.initPickContactState(context);
            },
            child: Icon(FontAwesomeIcons.xmark,
                color: isDark ? Colors.white : Colors.black)));
  }
}
