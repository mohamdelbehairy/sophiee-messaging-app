import 'package:flutter/material.dart';

import '../../../../../../models/group_model.dart';
import '../../../../../../utils/widget/messages/pick_contact/contact_name.dart';
import '../../../../../../utils/widget/messages/pick_contact/contact_number.dart';
import 'groups_chat_bottom_sheet_pick_contact_button.dart';

class ContactBottomSheetGroupBody extends StatelessWidget {
  const ContactBottomSheetGroupBody(
      {super.key,
      required this.size,
      required this.phoneContactName,
      required this.isDark,
      required this.formattedPhoneNumber,
      required this.groupModel,
      required this.phoneContactNumber});

  final Size size;
  final String phoneContactName;
  final bool isDark;
  final String formattedPhoneNumber;
  final GroupModel groupModel;
  final String phoneContactNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContactName(
                size: size, phoneContactName: phoneContactName, isDark: isDark),
            ContactNumber(
                formattedPhoneNumber: formattedPhoneNumber, isDark: isDark)
          ],
        ),
        GroupsChatBottomSheetPickContactButton(
            groupModel: groupModel,
            phoneContactNumber: phoneContactNumber,
            phoneContactName: phoneContactName),
      ],
    );
  }
}
