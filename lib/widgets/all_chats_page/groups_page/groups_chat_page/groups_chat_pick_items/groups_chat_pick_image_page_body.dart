import 'dart:io';

import 'package:sophiee/cubit/groups/groups_mdeia_files/group_store_media_files/group_store_media_files_cubit.dart';
import 'package:sophiee/cubit/notification/group_notification/group_notification_cubit.dart';
import 'package:sophiee/cubit/upload/upload_image/upload_image_cubit.dart';
import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../chat_page/pick_chat_items/pick_image_page/pick_image_custom_image.dart';
import '../../../chat_page/pick_chat_items/pick_items_text_field.dart';
import 'group_chat_pick_image_button.dart';

class GroupsChatPickImagePageBody extends StatefulWidget {
  const GroupsChatPickImagePageBody(
      {super.key,
      required this.image,
      required this.groupModel,
      required this.replayTextMessage,
      required this.friendNameReplay,
      required this.replayImageMessage,
      required this.replayFileMessage,
      required this.replayContactMessage,
      required this.replayMessageID,
      required this.replaySoundMessage,
      required this.replayRecordMessage,
      required this.tokens,
      required this.senderName,
      required this.isNotify,
      required this.isLoading});
  final File image;
  final GroupModel groupModel;
  final String replayTextMessage,
      friendNameReplay,
      replayImageMessage,
      replayFileMessage,
      replayContactMessage,
      replayMessageID,
      replaySoundMessage,
      replayRecordMessage,
      senderName;

  final List<String> tokens;
  final List<bool> isNotify;
  final bool isLoading;

  @override
  State<GroupsChatPickImagePageBody> createState() =>
      _GroupsChatPickImagePageBodyState();
}

class _GroupsChatPickImagePageBodyState
    extends State<GroupsChatPickImagePageBody> {
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
    var uploadImage = context.read<UploadImageCubit>();
    var storeMedia = context.read<GroupStoreMediaFilesCubit>();
    var sendGroupMessageNotify = context.read<GroupNotificationCubit>();

    return Stack(
      children: [
        PickImageCustomImage(image: widget.image),
        PickItemsTextField(
            size: size, isLoading: widget.isLoading, controller: controller),
        GroupChatPickImageButton(
            size: size,
            widget: widget,
            uploadImage: uploadImage,
            sendMessage: sendMessage,
            controller: controller,
            sendGroupMessageNotify: sendGroupMessageNotify,
            storeMedia: storeMedia),
      ],
    );
  }
}
