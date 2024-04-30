import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/chats/high_light_page/high_light_sub_title_body.dart';

class HighLightListTileSubTitle extends StatelessWidget {
  const HighLightListTileSubTitle(
      {super.key,
      required this.message,
      required this.size,
      required this.user});

  final MessageModel message;
  final Size size;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
            width:
                // message.replayRecordMessage != '' &&
                message.messageFile != null
                    // message.messageText != ''
                    ? size.width * .8
                    : message.messageImage != null ||
                            message.messageVideo != null ||
                            message.messageFile != null ||
                            message.phoneContactNumber != null ||
                            message.messageSound != null ||
                            message.messageRecord != null ||
                            message.replayTextMessage != '' ||
                            message.replayFileMessage != '' ||
                            message.replayImageMessage != '' ||
                            message.replayContactMessage != ''
                        // message.replaySoundMessage != ''
                        ? null
                        : message.replaySoundMessage != '' ||
                                message.replayRecordMessage != '' &&
                                    message.messageText != '' &&
                                    message.messageFile != null
                            ? size.width * .65
                            : message.replaySoundMessage != '' ||
                                    (message.replayRecordMessage != '')
                                ? null
                                : message.messageText.length <= 4
                                    ? size.width * .15
                                    : message.messageText.length <= 5
                                        ? size.width * .2
                                        : message.messageText.length > 50
                                            ? size.width * .8
                                            : null,
            margin: EdgeInsets.symmetric(
                horizontal: size.width * .03, vertical: size.width * .003),
            padding: EdgeInsets.only(
                right: message.messageImage != null ||
                        message.messageVideo != null ||
                        message.messageSound != null ||
                        message.messageRecord != null
                    ? 0.0
                    : message.messageFile != null
                        ? size.width * .02
                        : message.phoneContactNumber != null
                            ? 10
                            : size.width * .01,
                left: message.messageFile != null
                    ? 6
                    : message.phoneContactNumber != null
                        ? 6
                        : 0,
                bottom: message.messageFile != null
                    ? 6
                    : message.phoneContactNumber != null
                        ? 8
                        : 0.0,
                top: message.phoneContactNumber != null ? 8 : 0.0),
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
            child: HighLightSubTitelBody(
                message: message, size: size, user: user)));
  }
}
