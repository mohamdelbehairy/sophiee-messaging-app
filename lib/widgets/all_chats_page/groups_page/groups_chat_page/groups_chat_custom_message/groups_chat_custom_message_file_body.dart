import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/open_files/open_files_cubit.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GroupsChatCustomMessageFileBody extends StatelessWidget {
  const GroupsChatCustomMessageFileBody(
      {super.key,
      required this.size,
      required this.message});

  final Size size;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
      var openFile = context.read<OpenFilesCubit>();
    return Padding(
      padding: EdgeInsets.only(left: size.width * .01),
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
              backgroundColor:
                  message.senderID == FirebaseAuth.instance.currentUser!.uid
                      ? Colors.white
                      : kPrimaryColor,
              child: Icon(FontAwesomeIcons.solidFilePdf,
                  color:
                      message.senderID == FirebaseAuth.instance.currentUser!.uid
                          ? kPrimaryColor
                          : Colors.white,
                  size: size.width * .05),
            ),
          ),
          SizedBox(width: size.width * .02),
          Expanded(
            child: Text(message.messageFileName!,
                style: TextStyle(
                    color: message.senderID ==
                            FirebaseAuth.instance.currentUser!.uid
                        ? Colors.white
                        : Colors.black),
                maxLines: null,
                overflow: TextOverflow.visible),
          ),
        ],
      ),
    );
  }
}
