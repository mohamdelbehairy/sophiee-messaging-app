import 'package:flutter/material.dart';

import 'pick_chat_text_field.dart';

class PickItemsTextField extends StatelessWidget {
  const PickItemsTextField(
      {super.key,
      required this.size,
      required this.isLoading,
      required this.controller});

  final Size size;
  final bool isLoading;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        height: size.height * .18,
        width: size.width,
        bottom: 0.0,
        child: PickChatTextField(
            isLoading: !isLoading,
            controller: controller,
            hintText: 'Enter a message...'));
  }
}