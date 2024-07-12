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
      required this.isDark,
      required this.userData});
  final Size size;
  final UserModel user, userData;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: Column(
        children: [
          if (!userData.blockUsers.contains(user.userID) &&
              user.emailAddress.isNotEmpty &&
              user.isPhoneAndEmail &&
              !user.isProfileLock)
            EmailAdressBottomSheet(user: user),
          if (!userData.blockUsers.contains(user.userID) &&
              user.emailAddress.isNotEmpty &&
              user.isPhoneAndEmail &&
              !user.isProfileLock)
            const SizedBox(height: 8),
          if (!userData.blockUsers.contains(user.userID) &&
              user.phoneNumber != null &&
              user.isPhoneAndEmail &&
              !user.isProfileLock)
            PhoneNumberBottomSheet(user: user),
          if (!userData.blockUsers.contains(user.userID) &&
              user.phoneNumber != null &&
              user.isPhoneAndEmail &&
              !user.isProfileLock)
            const SizedBox(height: 12),
          MediaFilesBottomSheet(size: size, user: user),
          const SizedBox(height: 12),
          HighlightsBottomSheet(user: user, size: size, isDark: isDark),
        ],
      ),
    );
  }
}
