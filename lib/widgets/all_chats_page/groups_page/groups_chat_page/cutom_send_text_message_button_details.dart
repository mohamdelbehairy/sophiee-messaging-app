import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/custom_send_message_text_message_button.dart';
import 'package:flutter/material.dart';

class CustomSendTextMessageButtonDetails extends StatelessWidget {
  const CustomSendTextMessageButtonDetails(
      {super.key,
      required this.groupChat,
      required this.controller,
      required this.groupModel,
      required this.scrollController,
      required this.isSwip,
      required this.messageModel,
      required this.userData});

  final GroupMessageCubit groupChat;
  final TextEditingController controller;
  final GroupModel groupModel;
  final ScrollController scrollController;
  final bool isSwip;
  final MessageModel? messageModel;
  final UserModel? userData;

  @override
  Widget build(BuildContext context) {
    return CustomSendTextMessageButton(
      groupChat: groupChat,
      controller: controller,
      groupModel: groupModel,
      scrollController: scrollController,
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
