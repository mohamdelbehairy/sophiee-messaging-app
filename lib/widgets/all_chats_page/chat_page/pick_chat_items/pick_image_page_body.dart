import 'dart:io';

import 'package:sophiee/cubit/chat_media_files/chat_store_media_files/chat_store_media_files_cubit.dart';
import 'package:sophiee/cubit/upload/upload_image/upload_image_cubit.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_chat_text_field.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_image_page_bottom.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_item_send_chat_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

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
      required this.replayRecordMessage});
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

  @override
  State<PickImagePageBody> createState() => _PickImagePageBodyState();
}

class _PickImagePageBodyState extends State<PickImagePageBody> {
  bool isClick = false;
  TextEditingController controller = TextEditingController();
  void navigation() {
    Navigation.navigationOnePop(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var uploadImage = context.read<UploadImageCubit>();
    var sendMessage = context.read<MessageCubit>();
    var storeMedia = context.read<ChatStoreMediaFilesCubit>();

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: size.height * .05),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: FileImage(widget.image), fit: BoxFit.fitWidth)),
        ),
        Positioned(
            height: size.height * .18,
            width: size.width,
            bottom: 0.0,
            child: PickChatTextField(
                controller: controller, hintText: 'Enter a message...')),
        Positioned(
          width: size.width,
          bottom: size.height * .015,
          child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
            builder: (context, state) {
              if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
                final currentUser = FirebaseAuth.instance.currentUser;
                if (currentUser != null) {
                  final userData = state.userModel.firstWhere(
                      (element) => element.userID == currentUser.uid);
                  return PickItemSendChatItemBottom(
                      user: widget.user,
                      isClick: isClick,
                      onTap: () async {
                        try {
                          setState(() {
                            isClick = true;
                          });
                          String imageUrl = await uploadImage.uploadImage(
                              fieldName: 'messages_images',
                              imageFile: widget.image);
                          String messageID = const Uuid().v4();
                          await sendMessage.sendMessage(
                              messageID: messageID,
                              friendNameReplay: widget.friendNameReplay,
                              replayMessageID: widget.replayMessageID,
                              receiverID: widget.user.userID,
                              imageUrl: imageUrl,
                              replayImageMessage:
                                  widget.replayImageMessageImage,
                              replayTextMessage: widget.replayTextMessageImage,
                              replayFileMessage: widget.replayFileMessageFile,
                              replayContactMessage:
                                  widget.replayContactMessageContact,
                              replaySoundMessage: widget.replaySoundMessage,
                              replayRecordMessage: widget.replayRecordMessage,
                              fileUrl: null,
                              phoneContactNumber: null,
                              phoneContactName: null,
                              videoUrl: null,
                              messageText: controller.text,
                              userName: widget.user.userName,
                              profileImage: widget.user.profileImage,
                              userID: widget.user.userID,
                              myUserName: userData.userName,
                              myProfileImage: userData.profileImage);
                          await storeMedia.storeMedia(
                              friendID: widget.user.userID,
                              messageImage: imageUrl,
                              messageID: messageID,
                              messageText: controller.text.isEmpty
                                  ? controller.text
                                  : null);
                          if (controller.text.startsWith('http') ||
                              controller.text.startsWith('https')) {
                            storeMedia.storeLink(
                                messageID: messageID,
                                friendID: widget.user.userID,
                                messageLink: controller.text);
                          }
                        } finally {
                          setState(() {
                            isClick = false;
                          });
                          navigation();
                        }
                      });
                } else {
                  return Container();
                }
              } else {
                return Container();
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
