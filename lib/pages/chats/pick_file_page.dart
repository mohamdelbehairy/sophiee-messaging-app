import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/upload/upload_file/upload_file_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_file_page/pick_file_page_body.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

import '../../widgets/all_chats_page/chat_page/pick_chat_items/pick_file_page/pick_file_app_bar.dart';

class PickFilePage extends StatelessWidget {
  const PickFilePage(
      {super.key,
      required this.file,
      required this.user,
      required this.replayTextMessage,
      required this.replayImageMessage,
      required this.replayFileMessage,
      required this.friendNameReplay,
      required this.replayMessageID,
      required this.replayContactMessage,
      required this.size,
      required this.replaySoundMessage,
      required this.replayRecordMessage});
  final File file;
  final UserModel user;
  final String replayTextMessage;
  final String replayImageMessage;
  final String replayFileMessage;
  final String friendNameReplay;
  final String replayMessageID;
  final String replayContactMessage;
  final String replaySoundMessage;
  final String replayRecordMessage;
  final Size size;

  @override
  Widget build(BuildContext context) {
    String fileName = path.basename(file.path);
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
            return PickFilePageBody(
                isLoading: isLoading,
                replayContactMessage: replayContactMessage,
                friendNameReplay: friendNameReplay,
                replayMessageID: replayMessageID,
                replaySoundMessage: replaySoundMessage,
                replayRecordMessage: replayRecordMessage,
                file: file,
                user: user,
                messageFileName: fileName,
                replayTextMessage: replayTextMessage,
                replayImageMessage: replayImageMessage,
                replayFileMessage: replayFileMessage);
          },
        ));
  }
}
