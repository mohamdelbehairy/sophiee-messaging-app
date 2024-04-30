import 'dart:io';

import 'package:sophiee/cubit/groups/groups_mdeia_files/group_store_media_files/group_store_media_files_cubit.dart';
import 'package:sophiee/cubit/upload/upload_image/upload_image_cubit.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_chat_text_field.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_image_page_bottom.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_send_chat_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

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
      required this.replayRecordMessage});
  final File image;
  final GroupModel groupModel;
  final String replayTextMessage;
  final String friendNameReplay;
  final String replayImageMessage;
  final String replayFileMessage;
  final String replayContactMessage;
  final String replayMessageID;
  final String replaySoundMessage;
  final String replayRecordMessage;

  @override
  State<GroupsChatPickImagePageBody> createState() =>
      _GroupsChatPickImagePageBodyState();
}

class _GroupsChatPickImagePageBodyState
    extends State<GroupsChatPickImagePageBody> {
  TextEditingController controller = TextEditingController();
  bool isClick = false;
  navigation() {
    Navigation.navigationOnePop(context: context);
  }

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

    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(top: size.height * .05),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: FileImage(widget.image), fit: BoxFit.fitWidth))),
        Positioned(
            height: size.height * .18,
            width: size.width,
            bottom: 0.0,
            child: PickChatTextField(
                controller: controller, hintText: 'Enter a message...')),
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
                String imageUrl = await uploadImage.uploadImage(
                    imageFile: widget.image,
                    fieldName: 'groups_messages_images');
                String messageID = const Uuid().v4();
                await sendMessage.sendGroupMessage(
                    messageID: messageID,
                    imageUrl: imageUrl,
                    videoUrl: null,
                    messageText: controller.text,
                    groupID: widget.groupModel.groupID,
                    replayImageMessage: widget.replayImageMessage,
                    friendNameReplay: widget.friendNameReplay,
                    replayMessageID: widget.replayMessageID,
                    replayContactMessage: widget.replayContactMessage,
                    replayFileMessage: widget.replayFileMessage,
                    replayTextMessage: widget.replayTextMessage,
                    replaySoundMessage: widget.replaySoundMessage,
                    replayRecordMessage: widget.replayRecordMessage);

                await storeMedia.storeMedia(
                    groupID: widget.groupModel.groupID,
                    messageImage: imageUrl,
                    messageID: messageID,
                    messageText:
                        controller.text.isEmpty ? controller.text : null);
                if (controller.text.startsWith('http') ||
                    controller.text.startsWith('https')) {
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
        Positioned(
          top: size.height * .15,
          left: size.width * .04,
          child: PickImagePageBottom(
            icon: FontAwesomeIcons.xmark,
            color: Colors.transparent,
            onTap: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}
