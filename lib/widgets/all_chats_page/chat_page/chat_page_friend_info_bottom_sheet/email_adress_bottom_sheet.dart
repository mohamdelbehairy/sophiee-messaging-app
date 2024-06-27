import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../models/users_model.dart';
import 'chat_page_friend_info_connection.dart';

class EmailAdressBottomSheet extends StatelessWidget {
  const EmailAdressBottomSheet({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ChatPageFriendInfoConnection(
        onTap: () async {
          if (user.emailAddress.isNotEmpty) {
            launchUrl(Uri.parse('mailto:${user.emailAddress}'));
          }
        },
        text: 'Contact Info',
        textInfo: user.emailAddress,
        iconColor: Colors.blue,
        icon: Icons.email);
  }
}
