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
      required this.userData,
      required this.size});
  final GroupModel groupModel;
  final UserModel userData;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: size.width * .01),
      child: Row(
        children: [
          if (groupModel.groupOwnerID == userData.userID)
            Padding(
                padding: EdgeInsets.only(right: size.width * .01),
                child: Icon(Icons.admin_panel_settings,
                    color: kPrimaryColor, size: size.width * .06)),
          if (groupModel.adminsID.contains(userData.userID))
            Padding(
                padding: EdgeInsets.only(
                    right: groupModel.adminsID
                            .contains(FirebaseAuth.instance.currentUser!.uid)
                        ? size.width * .04
                        : 0.0),
                child: Icon(FontAwesomeIcons.userTie,
                    color: kPrimaryColor, size: size.width * .05)),
          // SizedBox(width: size.width * .015),
          if (userData.userID != FirebaseAuth.instance.currentUser!.uid)
            ControlMembersIcon(
                size: size, userData: userData, groupModel: groupModel),
        ],
      ),
    );
  }
}
