import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/users_model.dart';
import '../../../utils/widget/flutter_toast_widget.dart';
import 'chat_page_app_bar_friend_image.dart';
import 'chat_page_app_bar_friend_name_and_status.dart';
import 'chat_page_friend_info_bottom_sheet/chat_page_friend_info_bottom_sheet.dart';

class ChatPageAppBarTitleBody extends StatelessWidget {
  const ChatPageAppBarTitleBody(
      {super.key,
      required this.userData,
      required this.user,
      required this.data,
      required this.size,
      required this.isDark,
      required this.text});

  final UserModel userData, user, data;
  final Size size;
  final bool isDark;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () async {
                  if (!await isUserFound(userID: user.userID)) {
                    FlutterToastWidget.showToast(
                        msg: 'this account has been deleted');
                  } else if (userData.blockUsers.contains(user.userID)) {
                    FlutterToastWidget.showToast(
                        msg: 'You blocked ${user.userName}');
                  } else if (user.blockUsers.contains(userData.userID)) {
                    FlutterToastWidget.showToast(
                        msg: '${user.userName.split(" ")[0]} is blocked you');
                  } else {
                    showModalBottomSheet(
                        // ignore: use_build_context_synchronously
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => ChatPageFriendBottomSheetInfo(
                            user: data, userData: userData));
                  }
                },
                child: ChatPageAppBarFriendImage(
                    size: size,
                    isDark: isDark,
                    data: data,
                    userData: userData,
                    user: user)),
            const SizedBox(width: 8),
            ChatPageAppBarFriendNameAndStatus(
                userData: userData,
                user: user,
                size: size,
                data: data,
                text: text),
          ],
        ),
      ],
    );
  }

  Future<bool> isUserFound({required String userID}) async {
    var document =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    if (document.exists) {
      return true;
    }
    return false;
  }
}
