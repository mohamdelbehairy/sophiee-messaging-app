import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';

class InfoCallsWidget extends StatelessWidget {
  const InfoCallsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {},
              child: const Icon(Icons.call, size: 30, color: Colors.blue)),
          const SizedBox(width: 30),
          GestureDetector(
              onTap: () {},
              child: const Icon(FontAwesomeIcons.video,
                  size: 30, color: kPrimaryColor)),
        ],
      ),
    );
  }
}
