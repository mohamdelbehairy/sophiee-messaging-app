import 'package:flutter/material.dart';
import 'package:sophiee/widgets/text_field.dart';

class TextFieldUserName extends StatelessWidget {
  const TextFieldUserName({super.key, required this.userName});

  final TextEditingController userName;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        controller: userName,
        validator: (value) {
          if (value!.isEmpty) {
            return "user name is required";
          } else {
            return null;
          }
        },
        hintText: 'User Name');
  }
}