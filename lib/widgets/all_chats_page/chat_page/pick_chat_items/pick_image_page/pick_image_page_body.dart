import 'dart:io';

import 'package:sophiee/cubit/chat_media_files/chat_store_media_files/chat_store_media_files_cubit.dart';
import 'package:sophiee/cubit/notification/message_notification/message_notification_cubit.dart';
import 'package:sophiee/cubit/upload/upload_image/upload_image_cubit.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pick_image_button.dart';
import 'pick_image_custom_image.dart';
import '../pick_items_text_field.dart';

class PickImagePageBody extends StatefulWidget {
  const PickImagePageBody(
      {super.key,
      required this.image,
      required this.user,
      required this.replayTextMessageImage,
      required this.replayImageMessageImage,
      required this.replayFileMessageFile,
      required this.replayContactMessageContact,
      required this.friendNameReplay,
      required this.replayMessageID,
      required this.replaySoundMessage,
      required this.replayRecordMessage,
      required this.isLoading});
  final File image;
  final UserModel user;
  final String replayTextMessageImage;
  final String replayImageMessageImage;
  final String replayFileMessageFile;
  final String replayContactMessageContact;
  final String friendNameReplay;
  final String replayMessageID;
  final String replaySoundMessage;
  final String replayRecordMessage;
  final bool isLoading;

  @override
  State<PickImagePageBody> createState() => _PickImagePageBodyState();
}

class _PickImagePageBodyState extends State<PickImagePageBody> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var uploadImage = context.read<UploadImageCubit>();
    var sendMessage = context.read<MessageCubit>();
    var storeMedia = context.read<ChatStoreMediaFilesCubit>();
    var sendMessageNotification = context.read<MessageNotificationCubit>();

    return Stack(
      children: [
        PickImageCustomImage(image: widget.image),
        PickItemsTextField(
            size: size, isLoading: widget.isLoading, controller: controller),
        PickImageButton(
            size: size,
            widget: widget,
            uploadImage: uploadImage,
            sendMessage: sendMessage,
            controller: controller,
            storeMedia: storeMedia,
            sendMessageNotification: sendMessageNotification),
      ],
    );
  }
}

