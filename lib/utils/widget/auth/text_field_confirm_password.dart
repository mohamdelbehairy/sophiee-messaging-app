import 'package:flutter/material.dart';
import 'package:sophiee/widgets/text_field.dart';

class TextFieldConfirmPassword extends StatelessWidget {
  const TextFieldConfirmPassword(
      {super.key,
      required this.confirmPassword,
      required this.password,
      required this.isLoading});

  final TextEditingController confirmPassword;
  final TextEditingController password;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        isLoading: isLoading,
        controller: confirmPassword,
        validator: (value) {
          if (value!.isEmpty) {
            return 'confirm password is required';
          }
          if (password.text != confirmPassword.text) {
            return 'Password Do not match';
          } else {
            return null;
          }
        },
        obscureText: true,
        hintText: 'Confirm Password');
  }
}
