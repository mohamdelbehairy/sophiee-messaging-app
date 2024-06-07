import 'dart:io';

import 'package:sophiee/cubit/groups/groups_mdeia_files/group_store_media_files/group_store_media_files_cubit.dart';
import 'package:sophiee/cubit/upload/upload_file/upload_file_cubit.dart';
import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubit/notification/group_notification/group_notification_cubit.dart';
import '../../../chat_page/pick_chat_items/pick_file_page/pick_file_custom_file.dart';
import '../../../chat_page/pick_chat_items/pick_items_text_field.dart';
import 'group_chat_pick_file_button.dart';

class GroupsChatPickFilePageBody extends StatefulWidget {
  const GroupsChatPickFilePageBody(
      {super.key,
      required this.file,
      required this.messageFileName,
      this.isClick = false,
      required this.groupModel,
      required this.replayTextMessage,
      required this.replayImageMessage,
      required this.replayFileMessage,
      required this.friendNameReplay,
      required this.replayMessageID,
      required this.replayContactMessage,
      required this.replaySoundMessage,
      required this.replayRecordMessage,
      required this.tokens,
      required this.senderName,
      required this.isNotify,
      required this.isLoading});
  final File file;
  final String messageFileName;
  final bool isClick;
  final GroupModel groupModel;
  final String replayTextMessage;
  final String replayImageMessage;
  final String replayFileMessage;
  final String friendNameReplay;
  final String replayMessageID;
  final String replayContactMessage;
  final String replaySoundMessage;
  final String replayRecordMessage;
  final List<String> tokens;
  final String senderName;
  final List<bool> isNotify;
  final bool isLoading;

  @override
  State<GroupsChatPickFilePageBody> createState() =>
      _GroupsPagePickFilePageBodyState();
}

class _GroupsPagePickFilePageBodyState
    extends State<GroupsChatPickFilePageBody> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sendMessage = context.read<GroupMessageCubit>();
    var uploadFile = context.read<UploadFileCubit>();
    var storeMedia = context.read<GroupStoreMediaFilesCubit>();
    var sendGroupMessageNotify = context.read<GroupNotificationCubit>();

    return Stack(
      children: [
        PickFileCustomFile(file: widget.file, isLoading: widget.isLoading),
        PickItemsTextField(
            size: size, isLoading: widget.isLoading, controller: controller),
        GroupChatPickFileButton(
            size: size,
            widget: widget,
            uploadFile: uploadFile,
            sendMessage: sendMessage,
            controller: controller,
            sendGroupMessageNotify: sendGroupMessageNotify,
            storeMedia: storeMedia),
      ],
    );
  }
}
