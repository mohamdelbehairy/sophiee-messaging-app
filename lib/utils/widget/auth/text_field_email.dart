import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/widgets/text_field.dart';

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({super.key, required this.emailAddress});

  final TextEditingController emailAddress;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        controller: emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return 'email address is required';
          }
          if (!EmailValidator.validate(value)) {
            return 'Please enter a valid email';
          } else {
            return null;
          }
        },
        textInputType: TextInputType.emailAddress,
        hintText: 'Email Address');
  }
}
