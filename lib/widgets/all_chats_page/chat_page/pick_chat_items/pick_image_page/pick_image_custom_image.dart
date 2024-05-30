import 'dart:io';

import 'package:flutter/material.dart';

class PickImageCustomImage extends StatelessWidget {
  const PickImageCustomImage({super.key, required this.image});

  final File image;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: FileImage(image), fit: BoxFit.fitWidth)));
  }
}