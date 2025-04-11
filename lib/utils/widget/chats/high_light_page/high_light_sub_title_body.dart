import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/chats/show_chat_image_page.dart';
import 'package:sophiee/pages/chats/show_chat_video_page.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/utils/widget/chats/high_light_page/high_light_custom_image.dart';
import 'package:sophiee/utils/widget/chats/high_light_page/high_light_custom_video.dart';
import 'package:sophiee/utils/widget/messages/custom_message_record.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/custom_message_audio/custom_message_sound.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/custom_message_contact.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/custom_message_file/custom_message_file.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/custom_message_text/custom_message_text.dart';
import 'package:url_launcher/url_launcher.dart';

class HighLightSubTitelBody extends StatelessWidget {
  const HighLightSubTitelBody(
      {super.key,
      required this.message,
      required this.size,
      required this.user});

  final MessageModel message;
  final Size size;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: message.messageImage != null ||
              message.messageVideo != null && message.messageText != '' ||
              message.messageFile != null
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        if (message.messageRecord != null)
          CustomMessageRecord(
              iconColor: Colors.white,
              sliderWidth: message.replaySoundMessage != ''
                  ? size.width * .66
                  : size.width * .58,
              message: message,
              size: size,
              messageTextColor: Colors.white),
        if (message.messageSound != null)
          CustomMessageSound(
              iconColor: kPrimaryColor,
              backgroungColor: Colors.white,
              message: message,
              size: size,
              user: user,
              messageTextColor: Colors.white),
        if (message.phoneContactNumber != null)
          GestureDetector(
              onTap: () async {
                String url = 'tel:${message.phoneContactNumber}';
                if (await canLaunchUrl(Uri(scheme: 'tel', path: url))) {
                  await launchUrl(Uri(scheme: 'tel', path: url));
                } else {
                  debugPrint('error');
                }
              },
              child: CustomMessageContact(
                  message: message,
                  textColor: Colors.white,
                  backgrougColor: Colors.white,
                  color: kPrimaryColor)),
        if (message.messageFile != null)
          CustomMessageFile(
              message: message,
              messageTextColor: Colors.white,
              color: Colors.white),
        if (message.messageVideo != null)
          GestureDetector(
              onTap: () => Navigation.push(
                  context, ShowChatVideoPage(user: user, message: message)),
              child: HighLightCustomVideo(message: message, size: size)),
        if (message.messageImage != null)
          GestureDetector(
              onTap: () => Navigation.push(
                  context, ShowChatImagePage(user: user, message: message)),
              child: HighLightCustomImage(message: message, size: size)),
        if (message.messageText != '')
          GestureDetector(
            onTap: () async {
              if (message.messageText.startsWith('http') ||
                  message.messageText.startsWith('https')) {
                await launchUrl(Uri.parse(message.messageText));
              }
            },
            child: CustomMessageText(
                size: size,
                messageModel: message,
                messageTextColor: Colors.white),
          ),
      ],
    );
  }
}
