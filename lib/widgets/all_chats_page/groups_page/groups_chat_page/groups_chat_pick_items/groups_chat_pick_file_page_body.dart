import 'dart:io';

import 'package:sophiee/cubit/groups/groups_mdeia_files/group_store_media_files/group_store_media_files_cubit.dart';
import 'package:sophiee/cubit/upload/upload_file/upload_file_cubit.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_chat_text_field.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_send_chat_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:uuid/uuid.dart';

import '../../../../../cubit/notification/group_notification/group_notification_cubit.dart';

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
      required this.senderName});
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

  @override
  State<GroupsChatPickFilePageBody> createState() =>
      _GroupsPagePickFilePageBodyState();
}

class _GroupsPagePickFilePageBodyState
    extends State<GroupsChatPickFilePageBody> {
  TextEditingController controller = TextEditingController();
  bool isClick = false;
  void navigation() {
    Navigation.navigationOnePop(context: context);
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
        PDFView(
            filePath: widget.file.path,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: false,
            onError: (error) {
              debugPrint('error from pdf method: $error');
            }),
        Positioned(
            height: size.height * .18,
            width: size.width,
            bottom: 0.0,
            child: PickChatTextField(
                controller: controller, hintText: 'Add a caption...')),
        Positioned(
          width: size.width,
          bottom: size.height * .015,
          child: GroupsChatSendItemChatBottom(
            groupModel: widget.groupModel,
            isClick: isClick,
            onTap: () async {
              try {
                setState(() {
                  isClick = true;
                });
                String fileUrl = await uploadFile.uploadFile(
                    fieldName: 'groups_messages_files', file: widget.file);
                String messageID = const Uuid().v4();
                await sendMessage.sendGroupMessage(
                    messageID: messageID,
                    messageText: controller.text,
                    groupID: widget.groupModel.groupID,
                    imageUrl: null,
                    videoUrl: null,
                    phoneContactName: null,
                    phoneContactNumber: null,
                    fileUrl: fileUrl,
                    messageFileName: widget.messageFileName,
                    replayImageMessage: widget.replayImageMessage,
                    friendNameReplay: widget.friendNameReplay,
                    replayMessageID: widget.replayMessageID,
                    replayContactMessage: widget.replayContactMessage,
                    replayFileMessage: widget.replayFileMessage,
                    replayTextMessage: widget.replayTextMessage,
                    replaySoundMessage: widget.replaySoundMessage,
                    replayRecordMessage: widget.replayRecordMessage);
                for (var element in widget.tokens) {
                  await sendGroupMessageNotify.sendGroupMessageNotification(
                      receiverToken: element,
                      senderName: widget.groupModel.groupName,
                      message:
                          '${widget.senderName.split(' ')[0]} sent a file',
                      senderId: widget.groupModel.groupID);
                }

                await storeMedia.storeFile(
                    groupID: widget.groupModel.groupID,
                    messageID: messageID,
                    messageFile: fileUrl,
                    messageFileName: widget.messageFileName,
                    messageFileSize: await widget.file.length() / 1024 < 1024
                        ? await widget.file.length() / 1024
                        : await widget.file.length() / 1024 / 1024,
                    messageFileType:
                        await widget.file.length() / 1024 < 1024 ? 'KB' : 'MB');
                if (controller.text.isNotEmpty &&
                    (controller.text.startsWith('http') ||
                        controller.text.startsWith('https'))) {
                  await storeMedia.storeLink(
                      groupID: widget.groupModel.groupID,
                      messageID: messageID,
                      messageLink: controller.text);
                }
                navigation();
              } finally {
                setState(() {
                  isClick = false;
                });
              }
            },
          ),
        ),
      ],
    );
  }
}
