import 'package:sophiee/models/media_files_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/chats/message_forward_page.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/show_chat_media/show_chat_app_bar_pop_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getnav;

class ShowChatMediaAppBar extends StatelessWidget {
  const ShowChatMediaAppBar(
      {super.key,
      this.message,
      required this.user,
      required this.saveOnTap,
      required this.shareOnTap,
      this.mediaFiels});
  final MessageModel? message;
  final MediaFilesModel? mediaFiels;
  final UserModel user;
  final Function() saveOnTap;
  final Function() shareOnTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (message != null)
              if (message!.senderID == FirebaseAuth.instance.currentUser!.uid)
                Text('You', style: TextStyle(fontSize: size.height * .02))
              else
                Text(user.userName.split(' ')[0],
                    style: TextStyle(fontSize: size.height * .02)),
            if (mediaFiels != null)
              if (mediaFiels!.senderID ==
                  FirebaseAuth.instance.currentUser!.uid)
                Text('You', style: TextStyle(fontSize: size.height * .02))
              else
                Text(user.userName.split(' ')[0],
                    style: TextStyle(fontSize: size.height * .02)),
            Text(
              message != null
                  ? message!.showChatImageTime()
                  : mediaFiels!.showMediaTime(),
              style: TextStyle(fontSize: size.width * .03),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: size.width * .01),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () => getnav.Get.to(
                      () => MessageForwardPage(
                          user: user, message: message, mediaFiles: mediaFiels),
                      transition: getnav.Transition.rightToLeft),
                  child: Icon(FontAwesomeIcons.share, size: size.width * .06)),
              SizedBox(width: size.width * .01),
              ShowChatMediaAppBarPopMenu(
                  saveOnTap: saveOnTap, shareOnTap: shareOnTap),
            ],
          ),
        )
      ],
    );
  }
}
