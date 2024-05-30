import 'dart:io';
import 'package:sophiee/cubit/chat_media_files/chat_store_media_files/chat_store_media_files_cubit.dart';
import 'package:sophiee/cubit/notification/message_notification/message_notification_cubit.dart';
import 'package:sophiee/cubit/upload/upload_file/upload_file_cubit.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_items_text_field.dart';

import 'pick_file_button.dart';
import 'pick_file_custom_file.dart';

class PickFilePageBody extends StatefulWidget {
  const PickFilePageBody(
      {super.key,
      required this.file,
      required this.messageFileName,
      required this.user,
      required this.replayTextMessage,
      required this.replayImageMessage,
      required this.replayFileMessage,
      required this.friendNameReplay,
      required this.replayMessageID,
      required this.replayContactMessage,
      required this.replaySoundMessage,
      required this.replayRecordMessage,
      required this.isLoading});
  final File file;
  final String messageFileName;

  final UserModel user;
  final String replayTextMessage;
  final String replayImageMessage;
  final String replayFileMessage;
  final String friendNameReplay;
  final String replayMessageID;
  final String replayContactMessage;
  final String replaySoundMessage;
  final String replayRecordMessage;
  final bool isLoading;

  @override
  State<PickFilePageBody> createState() => _GroupsPagePickFilePageBodyState();
}

class _GroupsPagePickFilePageBodyState extends State<PickFilePageBody> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var message = context.read<MessageCubit>();
    var uploadFile = context.read<UploadFileCubit>();
    var storeMedia = context.read<ChatStoreMediaFilesCubit>();
    var sendMessageNotification = context.read<MessageNotificationCubit>();

    return Stack(
      children: [
        PickFileCustomFile(file: widget.file, isLoading: widget.isLoading),
        PickItemsTextField(
            size: size, isLoading: widget.isLoading, controller: controller),
        PickFileButton(
            size: size,
            widget: widget,
            uploadFile: uploadFile,
            message: message,
            controller: controller,
            storeMedia: storeMedia,
            sendMessageNotification: sendMessageNotification)
      ],
    );
  }
}
