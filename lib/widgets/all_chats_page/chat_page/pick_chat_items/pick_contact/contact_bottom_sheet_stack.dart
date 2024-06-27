import 'package:flutter/material.dart';

import '../../../../../models/users_model.dart';
import 'contact_bottom_sheet_body.dart';
import '../../../../../utils/widget/messages/pick_contact/contact_icon_close.dart';

class ContactBottomSheetStack extends StatelessWidget {
  const ContactBottomSheetStack(
      {super.key,
      required this.size,
      required this.phoneContactName,
      required this.isDark,
      required this.formattedPhoneNumber,
      required this.phoneContactNumber,
      required this.user});

  final Size size;
  final String phoneContactName;
  final bool isDark;
  final String formattedPhoneNumber;
  final String phoneContactNumber;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ContactBottomSheetBody(
            size: size,
            phoneContactName: phoneContactName,
            isDark: isDark,
            formattedPhoneNumber: formattedPhoneNumber,
            phoneContactNumber: phoneContactNumber,
            user: user),
        ContactIconClose(size: size, isDark: isDark)
      ],
    );
  }
}
