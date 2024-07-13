import 'package:sophiee/constants.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_members_page/control_members_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GroupsChatMemebrIconActions extends StatelessWidget {
  const GroupsChatMemebrIconActions(
      {super.key,
      required this.groupModel,
      required this.membersData,
      required this.size,
      required this.userData});
  final GroupModel groupModel;
  final UserModel membersData, userData;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: size.width * .01),
      child: Row(
        children: [
          if (groupModel.groupOwnerID == membersData.userID)
            Padding(
                padding: EdgeInsets.only(right: size.width * .01),
                child: Icon(Icons.admin_panel_settings,
                    color: kPrimaryColor, size: size.width * .06)),
          if (groupModel.adminsID.contains(membersData.userID))
            Padding(
                padding: EdgeInsets.only(
                    right: groupModel.adminsID
                            .contains(FirebaseAuth.instance.currentUser!.uid)
                        ? size.width * .04
                        : 0.0),
                child: Icon(FontAwesomeIcons.userTie,
                    color: kPrimaryColor, size: size.width * .05)),
          if ((membersData.userID != userData.userID &&
              (membersData.blockUsers.contains(userData.userID) ||
                  userData.blockUsers.contains(membersData.userID))))
            SizedBox(width: size.width * .015),
          if (membersData.userID != FirebaseAuth.instance.currentUser!.uid)
            if (membersData.userID != userData.userID &&
                !membersData.blockUsers.contains(userData.userID) &&
                !userData.blockUsers.contains(membersData.userID))
              ControlMembersIcon(
                  size: size, userData: membersData, groupModel: groupModel),
        ],
      ),
    );
  }
}
