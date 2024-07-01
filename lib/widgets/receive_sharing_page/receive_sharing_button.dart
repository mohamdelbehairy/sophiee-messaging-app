import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import '../../constants.dart';
import '../../cubit/forward/forward_selected_friend/forward_selected_friend_cubit.dart';
import '../../cubit/forward/forward_selected_group/forward_selected_group_cubit.dart';
import '../../cubit/upload/upload_image/upload_image_cubit.dart';

class ReceiveSharingButton extends StatelessWidget {
  const ReceiveSharingButton(
      {super.key,
      required this.size,
      required this.sharedFiles,
      required this.selectedFriend,
      required this.selectedGroup});

  final Size size;
  final ForwardSelectedFriendCubit selectedFriend;
  final ForwardSelectedGroupCubit selectedGroup;
  final List<SharedMediaFile> sharedFiles;

  @override
  Widget build(BuildContext context) {
    var uploadImage = context.read<UploadImageCubit>();
    return GestureDetector(
      onTap: () async {
        SharedMediaFile sharedMediaFile = sharedFiles.first;
        if (sharedMediaFile.type == SharedMediaType.image) {
          log('image file: ${sharedFiles.first.path}');
          String imageUrl = await uploadImage.uploadImage(
              imageFile: File(sharedFiles.first.path),
              fieldName: 'messages_images');
          log('image url: $imageUrl');
        } else if (sharedMediaFile.type == SharedMediaType.video) {
          log('video file: ${sharedFiles.first.path}');
        } else if (sharedMediaFile.type == SharedMediaType.text) {
          log('text: ${sharedFiles.first.path}');
        } else if (sharedMediaFile.type == SharedMediaType.file) {
          log('file: ${sharedFiles.first.path}');
        }
      },
      child: CircleAvatar(
          radius: size.width * .08,
          backgroundColor: kPrimaryColor,
          child: Icon(Icons.send, color: Colors.white, size: size.width * .07)),
    );
  }
}
