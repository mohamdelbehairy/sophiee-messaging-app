import 'package:flutter/material.dart';

import '../../../../../../models/group_model.dart';
import '../../../../../../utils/widget/messages/pick_contact/contact_icon_close.dart';
import 'contact_bottom_sheet_group_body.dart';

class ContactBottomSheetGroupStack extends StatelessWidget {
  const ContactBottomSheetGroupStack(
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
    return Stack(
      children: [
        ContactBottomSheetGroupBody(
            size: size,
            phoneContactName: phoneContactName,
            isDark: isDark,
            formattedPhoneNumber: formattedPhoneNumber,
            groupModel: groupModel,
            phoneContactNumber: phoneContactNumber),
        ContactIconClose(size: size, isDark: isDark),
      ],
    );
  }
}
