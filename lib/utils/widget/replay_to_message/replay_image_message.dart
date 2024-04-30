import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';

class ReplayImageMessage extends StatelessWidget {
  const ReplayImageMessage(
      {super.key,
      required this.messageModel,
      this.user,
      required this.onTap,
      this.groupModel});
  final MessageModel messageModel;
  final UserModel? user;
  final GroupModel? groupModel;
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
                    Container(
                      height: size.height * .045,
                      width: size.height * .045,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  messageModel.messageImage!),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(width: size.width * .03),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.only(bottom: size.height * .005),
                            child: Text(
                                'Reply to ${user != null ? user!.userName : groupModel!.groupName}')),
                        SizedBox(
                          width: size.width * .5,
                          child: Text(
                            messageModel.messageImage != null &&
                                    messageModel.messageText != ''
                                ? messageModel.messageText
                                : messageModel.messageImage != null
                                    ? 'Photo'
                                    : '',
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
            )),
      ),
    );
  }
}
