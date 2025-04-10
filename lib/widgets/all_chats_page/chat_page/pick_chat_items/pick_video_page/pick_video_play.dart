import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PickVideoPlayVideo extends StatelessWidget {
  const PickVideoPlayVideo({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Center(
        child: CircleAvatar(
          backgroundColor: const Color(0xff585558).withValues(alpha:  .3),
          child: Icon(FontAwesomeIcons.play,
              color: Colors.white, size: size.width * .05),
        ),
      ),
    );
  }
}