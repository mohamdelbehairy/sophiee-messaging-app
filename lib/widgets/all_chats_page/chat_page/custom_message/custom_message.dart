import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/messages/custom_message_pop_menu_button.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/message_date_time.dart';
import 'package:sophiee/pages/chats/show_chat_image_page.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/custom_message_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;
import 'package:url_launcher/url_launcher.dart';

class CustomMessage extends StatelessWidget {
  const CustomMessage(
      {super.key,
      required this.message,
      required this.backGroundMessageColor,
      required this.messageTextColor,
      required this.alignment,
      required this.bottomLeft,
      required this.bottomRight,
      required this.isSeen,
      required this.user});
  final MessageModel message;
  final Color backGroundMessageColor;
  final Color messageTextColor;
  final Alignment alignment;
  final Radius bottomLeft;
  final Radius bottomRight;
  final bool isSeen;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var messageCubit = context.read<MessageCubit>();

    return GestureDetector(
      onDoubleTap: () async {
        if (message.messageImage != null) {
          getnav.Get.to(() => ShowChatImagePage(message: message, user: user),
              transition: getnav.Transition.downToUp);
        }
        if (message.phoneContactNumber != null) {
          String url = 'tel:${message.phoneContactNumber}';

          if (await canLaunchUrl(Uri(scheme: 'tel', path: url))) {
            await launchUrl(Uri(scheme: 'tel', path: url));
          } else {
            debugPrint('error');
          }
        }
        if (message.messageText.startsWith('http') ||
            message.messageText.startsWith('https')) {
          await launchUrl(Uri.parse(message.messageText));
        }
      },
      child: Column(
        crossAxisAlignment:
            message.senderID == FirebaseAuth.instance.currentUser!.uid
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
        children: [
          CustomChatPopMenuButton(
              size: size,
              message: message,
              messageCubit: messageCubit,
              user: user,
              child: CustomMessageDetails(
                  alignment: alignment,
                  message: message,
                  size: size,
                  backGroundMessageColor: backGroundMessageColor,
                  user: user,
                  messageTextColor: messageTextColor)),
          MessageDateTime(size: size, message: message, isSeen: isSeen),
        ],
      ),
    );
  }
}
