import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/open_files/open_files_cubit.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/custom_message/custom_message_file/replay_message_file.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomMessageFile extends StatelessWidget {
  const CustomMessageFile(
      {super.key, required this.message, required this.messageTextColor, required this.color});
  final MessageModel message;
  final Color messageTextColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var openFile = context.read<OpenFilesCubit>();
    return Container(
      width: message.replayImageMessage != '' ||
              message.replayContactMessage != '' ||
              message.replayFileMessage != '' ||
              message.replaySoundMessage != ''
          ? size.width * .6
          : size.width * .55,
      margin: EdgeInsets.only(top: size.width * .01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message.replayImageMessage != '' ||
              message.replayTextMessage != '' ||
              message.replayContactMessage != '' ||
              message.replayFileMessage != '' ||
              message.replaySoundMessage != '' ||
              message.replayRecordMessage != '')
            ReplayMessageFile(
                message: message,
                messageTextColor: messageTextColor,
                size: size),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * .01,
                top: message.replayFileMessage != '' ||
                        message.replaySoundMessage != ''
                    ? size.width * .02
                    : 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: size.width * .005),
                GestureDetector(
                  onTap: () async {
                    await openFile.openFile(
                        fileUrl: message.messageFile!,
                        fileName: message.messageFileName!);
                  },
                  child: CircleAvatar(
                    radius: size.width * .042,
                    backgroundColor: message.senderID ==
                            FirebaseAuth.instance.currentUser!.uid
                        ? Colors.white
                        : kPrimaryColor,
                    child: Icon(FontAwesomeIcons.solidFilePdf,
                        color: message.senderID ==
                                FirebaseAuth.instance.currentUser!.uid
                            ? kPrimaryColor
                            : Colors.white,
                        size: size.width * .05),
                  ),
                ),
                SizedBox(width: size.width * .02),
                Expanded(
                  child: Text(message.messageFileName!,
                      style: TextStyle(
                          color: color),
                      maxLines: null,
                      overflow: TextOverflow.visible),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
