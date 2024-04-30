import 'package:flutter/material.dart';

class HighLightPageAppBarText extends StatelessWidget {
  const HighLightPageAppBarText({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Text('Highlight messages',
        style: TextStyle(
            color: Colors.white,
            fontSize: size.height * .025,
            fontWeight: FontWeight.normal));
  }
}
