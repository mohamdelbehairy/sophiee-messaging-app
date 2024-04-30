import 'package:flutter/material.dart';

class CustomTextNoMediaFiles extends StatelessWidget {
  const CustomTextNoMediaFiles(
      {super.key, required this.size, required this.text});

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(text,
            style:
                TextStyle(color: Colors.black, fontSize: size.height * .02)));
  }
}
