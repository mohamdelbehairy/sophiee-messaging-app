import 'package:flutter/material.dart';

import '../../../../../models/users_model.dart';
import 'contact_details.dart';
import 'pick_contact_bottom_sheet_button.dart';

class ContactBottomSheetBody extends StatelessWidget {
  const ContactBottomSheetBody(
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ContactDetails(
            size: size,
            phoneContactName: phoneContactName,
            isDark: isDark,
            formattedPhoneNumber: formattedPhoneNumber),
        PickContactBottomSheetButton(
            phoneContactName: phoneContactName,
            phoneContactNumber: phoneContactNumber,
            replayContactMessage: phoneContactNumber,
            user: user)
      ],
    );
  }
}
