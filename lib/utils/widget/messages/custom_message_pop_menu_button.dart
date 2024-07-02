import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getnav;
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/chat_high_lights/chat_high_light_message/chat_high_light_message_cubit.dart';
import 'package:sophiee/cubit/chat_high_lights/update_chat_high_light/update_chat_high_light_cubit.dart';
import 'package:sophiee/cubit/delete_messages/delete_chat_message_cubit.dart';
import 'package:sophiee/cubit/groups/delete_group_messages/delete_group_messages_cubit.dart';
import 'package:sophiee/cubit/groups/high_light_group_message/high_light_messages_user/high_light_messages_user_cubit.dart';
import 'package:sophiee/cubit/groups/high_light_group_message/hight_light_messages/high_light_messages_cubit.dart';
import 'package:sophiee/cubit/message/message_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/chats/message_forward_page.dart';
import 'package:sophiee/utils/widget/media/save_sound.dart';
import 'package:sophiee/utils/widget/media/share_media.dart';
import 'package:sophiee/utils/widget/messages/custom_pop_menu_item.dart';
import 'package:sophiee/utils/widget/messages/delete_message_show_dialog.dart';

class CustomChatPopMenuButton extends StatelessWidget {
  const CustomChatPopMenuButton(
      {super.key,
      required this.child,
      required this.size,
      required this.message,
      this.messageCubit,
      this.user,
      this.deleteGroupMessagesCubit,
      this.groupModel,
      this.highLightMessagesUserCubit,
      this.highLightMessagesCubit,
      this.deleteChatMediaFilesCubit});
  final Widget child;
  final Size size;
  final MessageModel message;
  final MessageCubit? messageCubit;
  final UserModel? user;
  final DeleteGroupMessagesCubit? deleteGroupMessagesCubit;
  final DeleteChatMessageCubit? deleteChatMediaFilesCubit;
  final GroupModel? groupModel;
  final HighLightMessagesUserCubit? highLightMessagesUserCubit;
  final HightLightMessagesCubit? highLightMessagesCubit;

  @override
  Widget build(BuildContext context) {
    var deleteMessage = context.read<DeleteChatMessageCubit>();
    var updateChatHighLightMessage = context.read<UpdateChatHighLightCubit>();
    var chatHighLightMessage = context.read<ChatHighLightMessageCubit>();

    return PopupMenuButton(
        color: kPrimaryColor,
        offset: Offset(
            message.senderID == FirebaseAuth.instance.currentUser!.uid ? 1 : 0,
            -size.height * .2),
        itemBuilder: (BuildContext context) {
          return [
            if (message.messageText == '')
              customPopMenuItemMethod(
                  name: 'Share',
                  size: size,
                  icon: Icons.share,
                  onTap: () async {
                    String? mediaUrl;
                    String? mediaType;
                    if (message.messageImage != null) {
                      mediaUrl = message.messageImage;
                      mediaType = 'image.jpg';
                    } else if (message.messageVideo != null) {
                      mediaUrl = message.messageVideo;
                      mediaType = 'video.mp4';
                    } else if (message.messageFile != null) {
                      mediaUrl = message.messageFile;
                      mediaType = '${message.messageFileName}';
                    } else if (message.phoneContactNumber != null) {
                      mediaUrl = message.phoneContactNumber;
                      mediaType = 'phone_number';
                    } else if (message.messageText != '') {
                      mediaUrl = message.messageText;
                      mediaType = message.messageText;
                    } else if (message.messageSound != null) {
                      mediaUrl = message.messageSound;
                      mediaType = '${message.messageSoundName}';
                    } else if (message.messageRecord != null) {
                      mediaUrl = message.messageRecord;
                      mediaType =
                          'record.${DateTime.now().millisecondsSinceEpoch}';
                    }
                    if (mediaUrl != null && mediaType != null) {
                      await shareMedia(
                          mediaUrl: mediaUrl, mediaType: mediaType);
                    }
                  }),
            if (message.messageSound != null || message.messageRecord != null)
              customPopMenuItemMethod(
                  name: 'Save',
                  size: size,
                  icon: Icons.save,
                  onTap: () async {
                    log('${message.messageSound}');
                    await saveSound(messages: message);
                  }),
            if (message.messageText.isNotEmpty)
              customPopMenuItemMethod(
                  name: 'Copy',
                  size: size,
                  icon: FontAwesomeIcons.copy,
                  onTap: () async {
                    final value = ClipboardData(text: message.messageText);
                    Clipboard.setData(value);
                  }),
            customPopMenuItemMethod(
                name: 'Forward',
                size: size,
                icon: FontAwesomeIcons.share,
                onTap: () {
                  getnav.Get.to(
                      MessageForwardPage(user: user, message: message),
                      transition: getnav.Transition.rightToLeft);
                }),
            if (groupModel != null)
              customPopMenuItemMethod(
                  name: message.highlightMessage!
                          .contains(FirebaseAuth.instance.currentUser!.uid)
                      ? 'Remove'
                      : 'Favourite',
                  size: size,
                  icon: message.highlightMessage!
                          .contains(FirebaseAuth.instance.currentUser!.uid)
                      ? Icons.heart_broken
                      : FontAwesomeIcons.solidHeart,
                  onTap: () async {
                    if (groupModel != null) {
                      if (message.highlightMessage!
                          .contains(FirebaseAuth.instance.currentUser!.uid)) {
                        await highLightMessagesUserCubit!
                            .removeHighLightMessageUser(
                                groupID: groupModel!.groupID,
                                messageID: message.messageID);
                        await highLightMessagesCubit!.removeHightLightMessages(
                            groupID: groupModel!.groupID,
                            messageModel: message);
                      } else {
                        await highLightMessagesUserCubit!
                            .storeHighLightMessageUser(
                                groupID: groupModel!.groupID,
                                messageID: message.messageID);
                        await highLightMessagesCubit!.storeHightLightMessages(
                            groupID: groupModel!.groupID,
                            messageModel: message);
                      }
                    }
                  }),
            if (user != null)
              customPopMenuItemMethod(
                  name: message.highlightChatMessage! ? 'Remove' : 'Favourite',
                  size: size,
                  icon: message.highlightChatMessage!
                      ? Icons.heart_broken
                      : FontAwesomeIcons.solidHeart,
                  onTap: () async {
                    if (message.highlightChatMessage!) {
                      await updateChatHighLightMessage
                          .updateChatHighLightMessage(
                              friendID: user!.userID,
                              messageID: message.messageID,
                              highlightChatMessage: false);
                      await chatHighLightMessage.removeChatHighLightMessage(
                          friendID: user!.userID, messageModel: message);
                    } else {
                      await updateChatHighLightMessage
                          .updateChatHighLightMessage(
                              friendID: user!.userID,
                              messageID: message.messageID,
                              highlightChatMessage: true);
                      await chatHighLightMessage.storeChatHighLightMessage(
                          friendID: user!.userID, messageModel: message);
                    }
                  }),
            if (message.messageText.isNotEmpty)
              customPopMenuItemMethod(
                  name: 'Pin',
                  size: size,
                  icon: Icons.push_pin_outlined,
                  angle: .5,
                  onTap: () {}),
            if (message.messageText.isNotEmpty)
              customPopMenuItemMethod(
                  name: 'Edit', size: size, icon: Icons.edit, onTap: () {}),
            if ((messageCubit != null && user != null) ||
                (groupModel!.groupOwnerID ==
                        FirebaseAuth.instance.currentUser!.uid ||
                    (groupModel!.adminsID
                            .contains(FirebaseAuth.instance.currentUser!.uid) &&
                        groupModel!.isDeleteMessage)))
              customPopMenuItemMethod(
                  name: 'Delete',
                  size: size,
                  icon: FontAwesomeIcons.trash,
                  onTap: () {
                    deleteMessageShowDialog(
                        context: context,
                        onPressed: () async {
                          Navigator.of(context).pop(false);
                          if (user != null) {
                            // await deleteChatMediaFilesCubit
                            //     .deleteChatMediaFiles(
                            //         friendID: user!.userID,
                            //         messageModel: message);
                            await deleteMessage.deleteMessage(
                                friendID: user!.userID, message: message);
                            // await messageCubit!.deleteMessage(
                            //     friendID: user!.userID,
                            //     message: message);
                          }
                          if (deleteGroupMessagesCubit != null &&
                              groupModel != null) {
                            await deleteGroupMessagesCubit!.deleteGroupMessage(
                                groupID: groupModel!.groupID,
                                messageModel: message);
                          }
                        });
                  }),
          ];
        },
        child: child);
  }
}
