import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: size.width * .05),
      child: Container(
        height: size.height *.001,
        width: double.infinity,
        color: Colors.grey.withOpacity(.5),
      ),
    );
  }
}
