import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_body_details.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/send_message/chat_page_send_text_message.dart';
import 'package:flutter/material.dart';

class CustomChatSendTextMessage extends StatelessWidget {
  const CustomChatSendTextMessage(
      {super.key,
      required this.scrollController,
      required this.messages,
      required this.widget,
      required this.textEditingController,
      required this.isSwip,
      required this.messageModel,
      required this.userData});

  final ScrollController scrollController;
  final MessageCubit messages;
  final ChatPageBodyDetails widget;
  final TextEditingController textEditingController;
  final bool isSwip;
  final MessageModel? messageModel;
  final UserModel? userData;

  @override
  Widget build(BuildContext context) {
    return ChatPageSendTextMessageButton(
      scrollController: scrollController,
      messages: messages,
      user: widget.user,
      textEditingController: textEditingController,
      replayTextMessage: isSwip ? messageModel!.messageText : '',
      friendNameReplay: isSwip
          ? userData != null
              ? userData!.userName
              : ''
          : '',
      replayImageMessage: isSwip
          ? messageModel!.messageImage != null &&
                      messageModel!.messageText == '' ||
                  messageModel!.messageImage != null &&
                      messageModel!.messageText != ''
              ? messageModel!.messageImage!
              : ''
          : '',
      replayFileMessage: isSwip && messageModel!.messageFileName != null
          ? messageModel!.messageFileName!
          : '',
      replayContactMessage: isSwip && messageModel!.phoneContactNumber != null
          ? messageModel!.phoneContactNumber!
          : '',
      replayMessageID: isSwip ? messageModel!.messageID : '',
      replaySoundMessage: isSwip && messageModel!.messageSound != null
          ? messageModel!.messageSoundName!
          : '',
      replayRecordMessage: isSwip && messageModel!.messageRecord != null
          ? messageModel!.messageRecord!
          : '',
    );
  }
}
