import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/custom_groups_send_record.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/cutom_send_text_message_button_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomGroupSendTextAndRecordItem extends StatelessWidget {
  const CustomGroupSendTextAndRecordItem(
      {super.key,
      required this.isShowSendButton,
      required this.controller,
      required this.groupModel,
      required this.scrollController,
      required this.size,
      required this.isSwip,
      this.messageModel,
      this.userData,
      this.stopRecording,
      required this.tokens,
      required this.senderName,
      required this.isNotify});

  final bool isShowSendButton;
  final TextEditingController controller;
  final GroupModel groupModel;
  final ScrollController scrollController;
  final Size size;
  final bool isSwip;
  final MessageModel? messageModel;
  final UserModel? userData;
  final Function(String)? stopRecording;
  final List<String> tokens;
  final String senderName;
  final List<bool> isNotify;

  @override
  Widget build(BuildContext context) {
    var groupChat = context.read<GroupMessageCubit>();
    return Positioned(
        bottom: 5,
        right: 5,
        child: isShowSendButton
            ? CustomSendTextMessageButtonDetails(
                isNotify: isNotify,
                senderName: senderName,
                tokens: tokens,
                groupChat: groupChat,
                controller: controller,
                groupModel: groupModel,
                scrollController: scrollController,
                isSwip: isSwip,
                messageModel: messageModel,
                userData: userData)
            : CustomGroupsSendRecord(
                isNotify: isNotify,
                senderName: senderName,
                tokens: tokens,
                stopRecording: stopRecording,
                isSwip: isSwip,
                userData: userData,
                messageModel: messageModel,
                size: size,
                groupChat: groupChat,
                groupModel: groupModel));
  }
}
