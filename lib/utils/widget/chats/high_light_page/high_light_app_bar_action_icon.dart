import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/chat_high_lights/chat_high_light_message/chat_high_light_message_cubit.dart';
import 'package:sophiee/cubit/groups/high_light_group_message/hight_light_messages/high_light_messages_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/custom_show_dialog.dart';

class HighLightAppBarActionIcon extends StatelessWidget {
  const HighLightAppBarActionIcon(
      {super.key,
      required this.size,
      this.hightLightMessage,
      this.groupModel,
      this.chatHighLightMessage,
      this.user});

  final Size size;
  final HightLightMessagesCubit? hightLightMessage;
  final GroupModel? groupModel;
  final ChatHighLightMessageCubit? chatHighLightMessage;
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return PopupMenuButton(
        color: isDark ? cardLightModeBackground : cardDarkModeBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        offset: Offset(0, size.height * .05),
        icon: Icon(FontAwesomeIcons.ellipsisVertical, size: size.height * .025),
        itemBuilder: (context) => [
              PopupMenuItem(
                  onTap: () => customShowDialog(
                      context: context,
                      doneButtonText: 'Remove all',
                      contentText: 'Remove all messages?',
                      // backgroundColor: kPrimaryColor,
                      isDark: isDark,
                      okFunction: () async {
                        Navigator.pop(context);
                        if (groupModel != null && hightLightMessage != null) {
                          await hightLightMessage!.removeAllHighLightMessages(
                              groupID: groupModel!.groupID);
                        }
                        if (user != null && chatHighLightMessage != null) {
                          await chatHighLightMessage!
                              .removeAllHighLightMessages(
                                  friendID: user!.userID);
                        }
                      }),
                  child: Padding(
                    padding: EdgeInsets.only(right: size.width * .044),
                    child: const Text('Remove all',
                        style: TextStyle(color: Colors.white)),
                  ))
            ]);
  }
}
