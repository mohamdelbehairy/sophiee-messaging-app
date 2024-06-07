import 'package:sophiee/cubit/pick_contact/pick_contact_cubit.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_state.dart';
import 'package:sophiee/cubit/pick_file/pick_file_cubit.dart';
import 'package:sophiee/cubit/pick_file/pick_file_state.dart';
import 'package:sophiee/cubit/pick_image/pick_image_cubit.dart';
import 'package:sophiee/cubit/pick_image/pick_image_state.dart';
import 'package:sophiee/cubit/pick_video/pick_video_cubit.dart';
import 'package:sophiee/cubit/pick_video/pick_video_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_pick_file_page.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_pick_image_page.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_pick_sound_page.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_pick_video_page.dart';
import 'package:sophiee/utils/widget/chats/chat_choose_media.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_message_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class GroupsChatPageSendMedia extends StatefulWidget {
  const GroupsChatPageSendMedia(
      {super.key,
      required this.size,
      required this.scrollController,
      required this.groupModel,
      required this.controller,
      required this.onChanged,
      required this.focusNode,
      this.userData,
      required this.replayTextMessage,
      required this.friendNameReplay,
      required this.replayImageMessage,
      required this.replayFileMessage,
      required this.replayContactMessage,
      required this.replayMessageID,
      required this.replaySoundMessage,
      required this.replayRecordMessage,
      required this.userDataModel,
      required this.tokens,
      required this.senderName,
      required this.isNotify});
  final Size size;
  final ScrollController scrollController;
  final GroupModel groupModel;
  final TextEditingController controller;
  final Function(String) onChanged;
  final FocusNode focusNode;
  final UserModel? userData;

  final String replayTextMessage;
  final String friendNameReplay;
  final String replayImageMessage;
  final String replayFileMessage;
  final String replayContactMessage;
  final String replayMessageID;
  final String replaySoundMessage;
  final String replayRecordMessage;
  final UserModel userDataModel;
  final List<String> tokens;
  final String senderName;
  final List<bool> isNotify;

  @override
  State<GroupsChatPageSendMedia> createState() =>
      _GroupsChatPageSendMediaState();
}

class _GroupsChatPageSendMediaState extends State<GroupsChatPageSendMedia> {
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isClick) ChatChooseMedia(size: widget.size),
        BlocListener<PickImageCubit, PickImageStates>(
          listener: (context, state) {
            if (state is PickImageSucccess && isClick) {
              getnav.Get.to(
                  () => GroupsChatPickImagePage(
                      isNotify: widget.isNotify,
                      tokens: widget.tokens,
                      senderName: widget.senderName,
                      replayTextMessage: widget.replayTextMessage,
                      friendNameReplay: widget.userData != null
                          ? widget.userData!.userName
                          : '',
                      replayImageMessage: widget.replayImageMessage,
                      replayFileMessage: widget.replayFileMessage,
                      replayContactMessage: widget.replayContactMessage,
                      replayMessageID: widget.replayMessageID,
                      replaySoundMessage: widget.replaySoundMessage,
                      replayRecordMessage: widget.replayRecordMessage,
                      image: state.image,
                      groupModel: widget.groupModel),
                  transition: getnav.Transition.rightToLeft);

              setState(() {
                isClick = false;
                context.read<PickImageCubit>().selectedImage = null;
              });
            }
          },
          child: BlocListener<PickFileCubit, PickFileState>(
            listener: (context, state) {
              if (state is PickFileSuccess) {
                final file = state.file;
                if ((file.path.toLowerCase().endsWith('.pdf') ||
                    file.path.toLowerCase().endsWith('.doc') ||
                    file.path.toLowerCase().endsWith('.txt'))) {
                  getnav.Get.to(
                      () => GroupsChatPickFilePage(
                          isNotify: widget.isNotify,
                          tokens: widget.tokens,
                          senderName: widget.senderName,
                          file: state.file,
                          groupModel: widget.groupModel,
                          replayTextMessage: widget.replayTextMessage,
                          friendNameReplay: widget.userData != null
                              ? widget.userData!.userName
                              : '',
                          replayImageMessage: widget.replayImageMessage,
                          replayFileMessage: widget.replayFileMessage,
                          replayContactMessage: widget.replayContactMessage,
                          replayMessageID: widget.replayMessageID,
                          replaySoundMessage: widget.replaySoundMessage,
                          replayRecordMessage: widget.replayRecordMessage),
                      transition: getnav.Transition.rightToLeft);
                }
                if (file.path.toLowerCase().endsWith('.mp3')) {
                  getnav.Get.to(() => GroupsChatPickSoundPage(
                        isNotify: widget.isNotify,
                        senderName: widget.senderName,
                        tokens: widget.tokens,
                        sound: file,
                        size: widget.size,
                        groupModel: widget.groupModel,
                        replayTextMessage: widget.replayTextMessage,
                        friendNameReplay: widget.userData != null
                            ? widget.userData!.userName
                            : '',
                        replayImageMessage: widget.replayImageMessage,
                        replayFileMessage: widget.replayFileMessage,
                        replayContactMessage: widget.replayContactMessage,
                        replayMessageID: widget.replayMessageID,
                        replaySoundMessage: widget.replaySoundMessage,
                        replayRecordMessage: widget.replayRecordMessage,
                      ));
                }

                setState(() {
                  isClick = false;
                });
              }
            },
            child: BlocListener<PickVideoCubit, PickVideoState>(
              listener: (context, state) {
                if (state is PickVideoSuccess) {
                  getnav.Get.to(
                      () => GroupsChatPickVideoPage(
                          isNotify: widget.isNotify,
                          senderName: widget.senderName,
                          tokens: widget.tokens,
                          video: state.video,
                          groupModel: widget.groupModel),
                      transition: getnav.Transition.rightToLeft);
                  setState(() {
                    isClick = false;
                  });
                }
              },
              child: BlocListener<PickContactCubit, PickContactState>(
                listener: (context, state) {
                  if (state is PickContactSuccess) {
                    setState(() {
                      isClick = false;
                    });
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      right: widget.size.width * .12,
                      bottom: widget.size.width * .01),
                  child: GroupChatMessageTextField(
                      userDataModel: widget.userDataModel,
                      focusNode: widget.focusNode,
                      controller: widget.controller,
                      onChanged: widget.onChanged,
                      onPressed: () {
                        setState(() {
                          isClick = !isClick;
                        });
                      }),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
