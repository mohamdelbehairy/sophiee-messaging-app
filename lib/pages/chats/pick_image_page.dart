import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/upload/upload_image/upload_image_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/initial_state.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/pick_chat_items/pick_image_page/pick_image_page_body.dart';
import 'package:flutter/material.dart';

import '../../widgets/all_chats_page/chat_page/pick_chat_items/pick_image_page_bottom.dart';

class PickImagePage extends StatelessWidget {
  const PickImagePage(
      {super.key,
      required this.image,
      required this.user,
      required this.replayTextMessageImage,
      required this.replayImageMessageImage,
      required this.replayFileMessageImage,
      required this.replayContactMessageContact,
      required this.friendNameReplay,
      required this.replayMessageID,
      required this.replaySoundMessage,
      required this.replayRecordMessage});
  final File image;
  final UserModel user;
  final String replayTextMessageImage;
  final String replayImageMessageImage;
  final String replayFileMessageImage;
  final String replayContactMessageContact;
  final String friendNameReplay;
  final String replayMessageID;
  final String replaySoundMessage;
  final String replayRecordMessage;

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
          return PickImagePageBody(
              isLoading: isLoading,
              replayMessageID: replayMessageID,
              friendNameReplay: friendNameReplay,
              image: image,
              user: user,
              replayTextMessageImage: replayTextMessageImage,
              replayImageMessageImage: replayImageMessageImage,
              replayFileMessageFile: replayFileMessageImage,
              replayContactMessageContact: replayContactMessageContact,
              replaySoundMessage: replaySoundMessage,
              replayRecordMessage: replayRecordMessage);
        },
      ),
    );
  }
}
