import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';

class ReplayAudioMessage extends StatelessWidget {
  const ReplayAudioMessage(
      {super.key,
      this.user,
      required this.messageModel,
      required this.onTap,
      this.groupModel});
  final UserModel? user;
  final GroupModel? groupModel;
  final MessageModel messageModel;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * .02),
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
                          child: Text(
                              'Reply to ${user != null ? user!.userName : groupModel!.groupName}')),
                      SizedBox(
                        width: size.width * .5,
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.music,
                                color: Colors.indigo, size: size.width * .035),
                            SizedBox(width: size.width * .01),
                            Text(
                              messageModel.messageSound != null
                                  ? 'sound'
                                  : 'record',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: size.height * .014),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              GestureDetector(
                  onTap: onTap,
                  child: const Icon(FontAwesomeIcons.xmark, color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}
