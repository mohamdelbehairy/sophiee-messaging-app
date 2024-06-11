import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/cubit/groups/message_group/group_message_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/replay_to_message/replay_audio_message.dart';
import 'package:sophiee/utils/widget/replay_to_message/replay_contact_message.dart';
import 'package:sophiee/utils/widget/replay_to_message/replay_file_message.dart';
import 'package:sophiee/utils/widget/replay_to_message/replay_image_message.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/custom_group_send_text_and_record_item.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_custom_message/groups_chat_custom_message_component_body.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_custom_send_media.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_not_send_message.dart';
import 'package:sophiee/utils/widget/replay_to_message/replay_text_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipe_to/swipe_to.dart';

import '../../../../utils/shimmer/home/all_chats/chat_page/message_page_shimmer.dart';

class GroupsChatPageBodyComponent extends StatefulWidget {
  const GroupsChatPageBodyComponent(
      {super.key,
      required this.groupModel,
      required this.scrollController,
      required this.controller,
      required this.isShowSendButton,
      required this.onChanged,
      required this.size,
      required this.userDataModel});
  final GroupModel groupModel;
  final ScrollController scrollController;
  final TextEditingController controller;
  final bool isShowSendButton;
  final Function(String) onChanged;
  final Size size;
  final UserModel userDataModel;

  @override
  State<GroupsChatPageBodyComponent> createState() =>
      _GroupsChatPageBodyComponentState();
}

class _GroupsChatPageBodyComponentState extends State<GroupsChatPageBodyComponent> {
  bool isSwip = false;

  MessageModel? messageModel;
  UserModel? userData;
  late FocusNode focusNode;
  List<String> tokens = [];
  List<bool> isNotify = [];
  String senderName = '';

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var groupChat = context.read<GroupMessageCubit>();
    return BlocConsumer<GroupMessageCubit, GroupMessageState>(
      listener: (context, state) {
        if (state is GetMessageGroupsSuccess ||
            state is SendMessageGroupSuccess) {
          setState(() {
            isSwip = false;
          });
        }
        if (state is SendMessageGroupSuccess) {
          isNotify = [];
        }
      },
      builder: (context, state) {
        if (state is GetMessageGroupsLoading) {
          return const MessagePageShimmer();
        }
        return Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: widget.scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: groupChat.groupMessageList.length,
                      itemBuilder: (context, index) {
                        var message = context
                            .read<GroupMessageCubit>()
                            .groupMessageList[index];
                        if (message.senderID !=
                            FirebaseAuth.instance.currentUser!.uid) {
                          groupChat.updateGroupsChatMessageSeen(
                              groupID: widget.groupModel.groupID,
                              messageID: message.messageID,
                              groupChatUsersIDSeen: [
                                FirebaseAuth.instance.currentUser!.uid
                              ]);
                        }
                        return SwipeTo(
                          onLeftSwipe: (details) {
                            setState(() {
                              isSwip = !isSwip;
                              messageModel = message;
                              focusNode.requestFocus();
                            });
                          },
                          key: Key(message.messageID),
                          child: GroupsChatCustomMessageComponentBody(
                              groupModel: widget.groupModel,
                              message: message,
                              size: widget.size),
                        );
                      }),
                ),
                SizedBox(height: widget.size.height * .01),
                if (widget.groupModel.isSendMessages ||
                    widget.groupModel.groupOwnerID ==
                        FirebaseAuth.instance.currentUser!.uid ||
                    widget.groupModel.adminsID
                        .contains(FirebaseAuth.instance.currentUser!.uid))
                  Column(
                    children: [
                      if (isSwip)
                        if (messageModel!.messageText != '' &&
                            messageModel!.messageImage == null &&
                            messageModel!.messageFileName == null)
                          ReplayTextMessage(
                              groupModel: widget.groupModel,
                              messageModel: messageModel!,
                              onTap: () {
                                setState(() {
                                  isSwip = false;
                                });
                              }),
                      if (isSwip)
                        if (messageModel!.messageImage != null &&
                            messageModel!.messageText == '')
                          ReplayImageMessage(
                              messageModel: messageModel!,
                              groupModel: widget.groupModel,
                              onTap: () {
                                setState(() {
                                  isSwip = false;
                                });
                              }),
                      if (isSwip)
                        if (messageModel!.messageImage != null &&
                            messageModel!.messageText != '')
                          ReplayImageMessage(
                              messageModel: messageModel!,
                              groupModel: widget.groupModel,
                              onTap: () {
                                setState(() {
                                  isSwip = false;
                                });
                              }),
                      if (isSwip)
                        if (messageModel!.messageFile != null)
                          ReplayFileMessage(
                            messageModel: messageModel!,
                            groupModel: widget.groupModel,
                            onTap: () {
                              setState(() {
                                isSwip = false;
                              });
                            },
                          ),
                      if (isSwip)
                        if (messageModel!.phoneContactNumber != null)
                          ReplayContactMessage(
                              messageModel: messageModel!,
                              groupModel: widget.groupModel,
                              onTap: () {
                                setState(() {
                                  isSwip = false;
                                });
                              }),
                      if (isSwip)
                        if (messageModel!.messageSound != null)
                          ReplayAudioMessage(
                              messageModel: messageModel!,
                              groupModel: widget.groupModel,
                              onTap: () {
                                setState(() {
                                  isSwip = false;
                                });
                              }),
                      if (isSwip)
                        if (messageModel!.messageRecord != null)
                          ReplayAudioMessage(
                              messageModel: messageModel!,
                              groupModel: widget.groupModel,
                              onTap: () {
                                setState(() {
                                  isSwip = false;
                                });
                              }),
                      if (isSwip) SizedBox(height: widget.size.width * .01),
                      BlocBuilder<GetUserDataCubit, GetUserDataStates>(
                        builder: (context, state) {
                          if (state is GetUserDataSuccess &&
                              state.userModel.isNotEmpty) {
                            tokens = [];
                            isNotify = [];
                            for (var usersID in widget.groupModel.usersID) {
                              if (usersID !=
                                  FirebaseAuth.instance.currentUser!.uid) {
                                var groupData = state.userModel.firstWhere(
                                    (element) => element.userID == usersID);

                                tokens.add(groupData.token ?? '');
                                isNotify.add(groupData.isGroupNotify);
                              }
                            }
                            var userName = state.userModel.firstWhere(
                                (element) =>
                                    element.userID ==
                                    FirebaseAuth.instance.currentUser!.uid);
                            senderName = userName.userName;

                            if (isSwip) {
                              final currentUser = messageModel!.senderID;
                              userData = state.userModel.firstWhere(
                                  (element) => element.userID == currentUser);
                            }
                          }
                          return GroupsChatPageCustomSendMedia(
                            isNotify: isNotify,
                            tokens: tokens,
                            senderName: senderName,
                            userDataModel: widget.userDataModel,
                            userData: userData,
                            messageModel: messageModel,
                            isSwip: isSwip,
                            focusNode: focusNode,
                            onChanged: widget.onChanged,
                            scrollController: widget.scrollController,
                            controller: widget.controller,
                            size: widget.size,
                            groupModel: widget.groupModel,
                          );
                        },
                      ),
                    ],
                  ),
                if (!widget.groupModel.isSendMessages &&
                    widget.groupModel.groupOwnerID !=
                        FirebaseAuth.instance.currentUser!.uid &&
                    !widget.groupModel.adminsID
                        .contains(FirebaseAuth.instance.currentUser!.uid))
                  GroupsChatPageNotSendMessage(size: widget.size)
              ],
            ),
            if (widget.groupModel.isSendMessages ||
                widget.groupModel.groupOwnerID ==
                    FirebaseAuth.instance.currentUser!.uid ||
                widget.groupModel.adminsID
                    .contains(FirebaseAuth.instance.currentUser!.uid))
              CustomGroupSendTextAndRecordItem(
                  isNotify: isNotify,
                  tokens: tokens,
                  senderName: senderName,
                  stopRecording: (value) {
                    setState(() {
                      isSwip = false;
                    });
                  },
                  userData: userData,
                  messageModel: messageModel,
                  isSwip: isSwip,
                  isShowSendButton: widget.isShowSendButton,
                  controller: widget.controller,
                  groupModel: widget.groupModel,
                  scrollController: widget.scrollController,
                  size: widget.size),
          ],
        );
      },
    );
  }
}
