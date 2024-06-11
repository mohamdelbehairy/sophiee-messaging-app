import 'package:flutter/material.dart';

import '../../../../../utils/widget/messages/pick_contact/contact_name.dart';
import '../../../../../utils/widget/messages/pick_contact/contact_number.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails(
      {super.key,
      required this.size,
      required this.phoneContactName,
      required this.isDark,
      required this.formattedPhoneNumber});

  final Size size;
  final String phoneContactName;
  final bool isDark;
  final String formattedPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContactName(
            size: size, phoneContactName: phoneContactName, isDark: isDark),
        ContactNumber(
            formattedPhoneNumber: formattedPhoneNumber, isDark: isDark),
      ],
    );
  }
}
