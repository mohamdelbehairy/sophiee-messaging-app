import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_send_media.dart';
import 'package:flutter/material.dart';

class GroupsChatPageCustomSendMedia extends StatelessWidget {
  const GroupsChatPageCustomSendMedia({
    super.key,
    required this.userData,
    required this.messageModel,
    required this.isSwip,
    required this.focusNode,
    required this.onChanged,
    required this.size,
    required this.scrollController,
    required this.controller,
    required this.groupModel, required this.userDataModel,
  });

  final UserModel? userData;
  final MessageModel? messageModel;
  final bool isSwip;
  final FocusNode focusNode;
  final Function(String) onChanged;
  final Size size;
  final ScrollController scrollController;
  final TextEditingController controller;
  final GroupModel groupModel;
  final UserModel userDataModel;

  @override
  Widget build(BuildContext context) {
    return GroupsChatPageSendMedia(
      userDataModel: userDataModel,
        userData: userData,
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
        focusNode: focusNode,
        onChanged: onChanged,
        controller: controller,
        size: size,
        scrollController: scrollController,
        groupModel: groupModel);
  }
}
