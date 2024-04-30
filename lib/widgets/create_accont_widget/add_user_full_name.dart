import 'package:sophiee/widgets/create_accont_widget/add_user_text_filed.dart';
import 'package:flutter/material.dart';

class AddUserFullName extends StatelessWidget {
  const AddUserFullName(
      {super.key,
      required this.size,
      required this.fullName,
      required this.enabled});

  final Size size;
  final TextEditingController fullName;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return AddUserTextField(
        enabled: enabled,
        size: size,
        hintText: 'Full Name',
        controller: fullName,
        validator: (value) {
          if (value!.isEmpty) {
            return "full name is required";
          } else {
            return null;
          }
        });
  }
}
