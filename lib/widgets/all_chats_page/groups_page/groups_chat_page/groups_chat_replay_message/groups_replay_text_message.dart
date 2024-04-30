import 'package:sophiee/constants.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GroupsReplyTextMessage extends StatelessWidget {
  const GroupsReplyTextMessage(
      {super.key,
      required this.onTap,
      required this.size,
      required this.messageModel,
      required this.groupModel});
  final Function() onTap;
  final Size size;
  final MessageModel messageModel;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * .012),
      child: Container(
        height: size.height * .06,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(size.height * .04)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.height * .02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: size.height * .02),
                        child: Icon(FontAwesomeIcons.sliders,
                            color: Colors.white, size: size.height * .012),
                      ),
                      Icon(FontAwesomeIcons.reply,
                          color: Colors.white, size: size.height * .025),
                    ],
                  ),
                  SizedBox(width: size.width * .03),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: size.height * .005),
                          child:
                              Text('Reply to ${groupModel.groupName} group')),
                      SizedBox(
                        width: size.width * .7,
                        child: Text(
                          messageModel.messageText,
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: size.height * .014),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: onTap,
                child: const Icon(FontAwesomeIcons.xmark, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
