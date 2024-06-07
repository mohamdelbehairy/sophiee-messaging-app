import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_pick_items/groups_chat_pick_file_page_body.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

import '../../../cubit/upload/upload_file/upload_file_cubit.dart';
import '../../../widgets/all_chats_page/chat_page/pick_chat_items/pick_file_page/pick_file_app_bar.dart';

class GroupsChatPickFilePage extends StatelessWidget {
  const GroupsChatPickFilePage(
      {super.key,
      required this.file,
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
      required this.senderName,
      required this.isNotify});
  final File file;
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
  final List<bool> isNotify;

  @override
  Widget build(BuildContext context) {
    String fileName = path.basename(file.path);
    final size = MediaQuery.of(context).size;
    var isLoading = context.read<UploadFileCubit>().isLoading;

    return Scaffold(
      appBar: pickFileAppBar(fileName, size),
      body: BlocConsumer<UploadFileCubit, UploadFileState>(
        listener: (context, state) {
          if (state is UploadFileLoading) {
            isLoading = state.isLoading;
          }
          if (state is UploadFileSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return GroupsChatPickFilePageBody(
              isLoading: isLoading,
              isNotify: isNotify,
              senderName: senderName,
              tokens: tokens,
              replayContactMessage: replayContactMessage,
              replayFileMessage: replayFileMessage,
              replayImageMessage: replayImageMessage,
              replayMessageID: replayMessageID,
              replayTextMessage: replayTextMessage,
              friendNameReplay: friendNameReplay,
              replaySoundMessage: replaySoundMessage,
              replayRecordMessage: replayRecordMessage,
              file: file,
              messageFileName: fileName,
              groupModel: groupModel);
        },
      ),
    );
  }
}
