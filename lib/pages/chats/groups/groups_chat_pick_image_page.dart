import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_pick_items/groups_chat_pick_image_page_body.dart';
import 'package:flutter/material.dart';

import '../../../cubit/upload/upload_image/upload_image_cubit.dart';
import '../../../utils/initial_state.dart';
import '../../../widgets/all_chats_page/chat_page/pick_chat_items/pick_image_page_bottom.dart';

class GroupsChatPickImagePage extends StatelessWidget {
  const GroupsChatPickImagePage(
      {super.key,
      required this.image,
      required this.groupModel,
      required this.replayTextMessage,
      required this.replayImageMessage,
      required this.replayFileMessage,
      required this.replayContactMessage,
      required this.friendNameReplay,
      required this.replayMessageID,
      required this.replaySoundMessage,
      required this.replayRecordMessage,
      required this.tokens,
      required this.senderName,
      required this.isNotify});
  final File image;
  final GroupModel groupModel;
  final String replayTextMessage;
  final String replayImageMessage;
  final String replayFileMessage;
  final String replayContactMessage;
  final String friendNameReplay;
  final String replayMessageID;
  final String replaySoundMessage;
  final String replayRecordMessage;
  final List<String> tokens;
  final String senderName;
  final List<bool> isNotify;

  @override
  Widget build(BuildContext context) {
    var isLoading = context.read<UploadImageCubit>().isLoading;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: PickImagePageBottom(
          icon: Icons.arrow_back,
          color: Colors.transparent,
          onTap: () {
            InitialState.initPickImageState(context);
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocConsumer<UploadImageCubit, UploadImageState>(
        listener: (context, state) {
          if (state is UploadImageLoading) {
            isLoading = state.isLoading;
          }
          if (state is UploadImageSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return GroupsChatPickImagePageBody(
            isLoading: isLoading,
            isNotify: isNotify,
            tokens: tokens,
            senderName: senderName,
            image: image,
            groupModel: groupModel,
            replayTextMessage: replayTextMessage,
            friendNameReplay: friendNameReplay,
            replayImageMessage: replayImageMessage,
            replayFileMessage: replayFileMessage,
            replayContactMessage: replayContactMessage,
            replayMessageID: replayMessageID,
            replaySoundMessage: replaySoundMessage,
            replayRecordMessage: replayRecordMessage,
          );
        },
      ),
    );
  }
}
