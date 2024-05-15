import 'package:flutter/material.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_friend_info_bottom_sheet/chat_page_friend_info_connection.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants.dart';
import '../../../../models/users_model.dart';

class PhoneNumberBottomSheet extends StatelessWidget {
  const PhoneNumberBottomSheet({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ChatPageFriendInfoConnection(
        onTap: () async {
          if (user.phoneNumber != null) {
            String url = 'tel:${user.phoneNumber}';

            if (await canLaunchUrl(Uri(scheme: 'tel', path: url))) {
              debugPrint('url: $url');
              await launchUrl(Uri(scheme: 'tel', path: url));
            } else {
              debugPrint('error');
            }
          }
        },
        text: 'Phone Call',
        textInfo: user.phoneNumber,
        iconColor: kPrimaryColor,
        icon: Icons.call);
  }
}
