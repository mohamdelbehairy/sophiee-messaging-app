import 'package:flutter/material.dart';

import '../custom_chat_text_field.dart';

class AddStoryTextField extends StatelessWidget {
  const AddStoryTextField(
      {super.key, required this.size, required this.controller});

  final Size size;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: size.height * 0.02,
        width: size.width,
        child: CustomChatTextField(
            hintText: 'Enter Type ....', controller: controller));
  }
}
