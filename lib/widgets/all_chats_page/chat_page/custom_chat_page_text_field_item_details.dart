import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/chat_page_body_details.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/send_message/custom_chat_page_item_send_message.dart';
import 'package:flutter/material.dart';

class CustomChatPageTextFieldItemDetails extends StatelessWidget {
  const CustomChatPageTextFieldItemDetails(
      {super.key,
      required this.widget,
      required this.textEditingController,
      required this.scrollController,
      required this.focusNode,
      required this.isSwip,
      required this.messageModel,
      required this.userData,
      required this.onChanged});

  final ChatPageBodyDetails widget;
  final TextEditingController textEditingController;
  final ScrollController scrollController;
  final FocusNode focusNode;
  final bool isSwip;
  final MessageModel? messageModel;
  final UserModel? userData;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return ChatPageTextFieldItem(
        size: widget.size,
        user: widget.user,
        textEditingController: textEditingController,
        scrollController: scrollController,
        focusNode: focusNode,
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
        onChanged: onChanged);
  }
}
