import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'email_adress_bottom_sheet.dart';
import 'high_lights_bottom_sheet.dart';
import 'media_files_bottom_sheet.dart';
import 'phone_number_bottom_sheet.dart';

class ChatPageFriendInfoBottomSheetDetails extends StatelessWidget {
  const ChatPageFriendInfoBottomSheetDetails(
      {super.key,
      required this.size,
      required this.user,
      required this.isDark});
  final Size size;
  final UserModel user;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Column(
        children: [
          if (user.emailAddress.isNotEmpty && user.isPhoneAndEmail && !user.isProfileLock)
            EmailAdressBottomSheet(user: user),
          if (user.emailAddress.isNotEmpty && user.isPhoneAndEmail && !user.isProfileLock) const SizedBox(height: 8),
          if (user.phoneNumber != null && user.isPhoneAndEmail && !user.isProfileLock) PhoneNumberBottomSheet(user: user),
          if (user.phoneNumber != null && user.isPhoneAndEmail && !user.isProfileLock) const SizedBox(height: 12),
          MediaFilesBottomSheet(size: size, user: user),
          const SizedBox(height: 12),
          HighlightsBottomSheet(user: user, size: size, isDark: isDark),
        ],
      ),
    );
  }
}
