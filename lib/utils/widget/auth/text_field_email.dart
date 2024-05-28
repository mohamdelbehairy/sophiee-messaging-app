import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/widgets/text_field.dart';

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({super.key, required this.emailAddress, this.isLoading});

  final TextEditingController emailAddress;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        isLoading: isLoading,
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
