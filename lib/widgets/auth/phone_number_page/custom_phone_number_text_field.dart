import 'package:sophiee/utils/widget/auth/phone_number_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhoneNumberTextField extends StatelessWidget {
  const CustomPhoneNumberTextField(
      {super.key,
      required this.size,
      required this.onChanged,
      required this.controller, required this.enabled});

  final Size size;
  final Function(PhoneNumber) onChanged;
  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * .08,
          right: size.width * .08,
          top: size.width * .04),
      child: PhoneNumberTextField(
          size: size,
          enabled: enabled,
          phoneNumber: controller,
          fillColor: Colors.white,
          hintText: 'Phone Number',
          dropDownColor: controller.text.isEmpty ? Colors.grey : Colors.black,
          disableLengthCheck: controller.text.isEmpty ? true : false,
          onChanged: onChanged),
    );
  }
}
