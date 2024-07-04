import 'package:sophiee/constants.dart';
import 'package:sophiee/models/media_files_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/media/save_image.dart';
import 'package:sophiee/utils/widget/media/share_media.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/show_chat_media/show_chat_media_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/widget/flutter_toast_widget.dart';

class ShowChatImagePage extends StatefulWidget {
  const ShowChatImagePage(
      {super.key, this.message, required this.user, this.mediaFiels});
  final MessageModel? message;
  final MediaFilesModel? mediaFiels;
  final UserModel user;

  @override
  State<ShowChatImagePage> createState() => _ShowChatImagePageState();
}

class _ShowChatImagePageState extends State<ShowChatImagePage> {
  bool isClick = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: isClick
          ? AppBar(
              backgroundColor: kPrimaryColor,
              titleSpacing: size.width * -.02,
              title: ShowChatMediaAppBar(
                message: widget.message,
                mediaFiels: widget.mediaFiels,
                user: widget.user,
                saveOnTap: () async {
                  await saveImage(
                      imageUrl: widget.message != null
                          ? widget.message!.messageImage!
                          : widget.mediaFiels!.messageImage!);
                  FlutterToastWidget.showToast(msg: "Image saved successfully");
                },
                shareOnTap: () async {
                  await shareMedia(
                      mediaUrl: widget.message != null
                          ? widget.message!.messageImage!
                          : widget.mediaFiels!.messageImage!,
                      mediaType: 'image.jpg');
                },
              ))
          : AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false),
      body: Padding(
        padding: EdgeInsets.only(top: size.height * .06),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isClick = !isClick;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(widget.message != null
                      ? widget.message!.messageImage!
                      : widget.mediaFiels!.messageImage!),
                  fit: BoxFit.fitWidth),
            ),
          ),
        ),
      ),
    );
  }
}
