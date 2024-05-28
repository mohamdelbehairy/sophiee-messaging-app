import 'package:flutter/material.dart';
import 'package:sophiee/widgets/text_field.dart';

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({super.key, required this.password, required this.isLoading});

  final TextEditingController password;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      isLoading: isLoading,
        controller: password,
        validator: (value) {
          if (value!.isEmpty) {
            return 'password is required';
          } else {
            debugPrint(password.text);
            return null;
          }
        },
        obscureText: true,
        hintText: 'Enter Password');
  }
}
