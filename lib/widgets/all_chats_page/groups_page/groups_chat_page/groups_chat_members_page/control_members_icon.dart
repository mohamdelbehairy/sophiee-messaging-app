import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/groups/groups_members_details/groups_members_details_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/my_friend_page.dart';
import 'package:sophiee/pages/chats/chat_page.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_members_page/remove_member_show_dialog.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_info/groups_info_pop_menu_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as getnav;

class ControlMembersIcon extends StatelessWidget {
  const ControlMembersIcon(
      {super.key,
      required this.size,
      required this.userData,
      required this.groupModel});
  final Size size;
  final UserModel userData;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    var groupMember = context.read<GroupsMembersDetailsCubit>();
    return PopupMenuButton(
        color: kPrimaryColor,
        offset: Offset(0, size.height * .05),
        icon: Icon(FontAwesomeIcons.ellipsisVertical,
            color: Colors.grey, size: size.width * .05),
        itemBuilder: (context) => [
              groupsInfoPopMenuItem(
                  onTap: () => getnav.Get.to(() => ChatPage(user: userData),
                      transition: getnav.Transition.leftToRight),
                  itemName: 'Message ${userData.userName.split(' ')[0]}',
                  size: size),
              groupsInfoPopMenuItem(
                  onTap: () => getnav.Get.to(() => MyFriendPage(user: userData),
                      transition: getnav.Transition.leftToRight),
                  itemName: 'View ${userData.userName.split(' ')[0]}',
                  size: size),
              if (groupModel.groupOwnerID ==
                  FirebaseAuth.instance.currentUser!.uid)
                groupsInfoPopMenuItem(
                    onTap: () async {
                      if (groupModel.adminsID.contains(userData.userID)) {
                        await groupMember.removeAdmin(
                            groupID: groupModel.groupID,
                            memberID: userData.userID);
                        debugPrint('تم حذف الادمن بنجاح');
                      } else {
                        await groupMember.makeAdmin(
                            groupID: groupModel.groupID,
                            memberID: userData.userID);
                        debugPrint('بقا ادمن');
                      }
                    },
                    itemName: groupModel.adminsID.contains(userData.userID)
                        ? 'Dismiss as admin'
                        : 'Make group admin',
                    size: size),
              if (groupModel.groupOwnerID ==
                  FirebaseAuth.instance.currentUser!.uid)
                groupsInfoPopMenuItem(
                    onTap: () => removeMemberShowDialog(
                        context: context,
                        removeGroupMember: groupMember,
                        userData: userData,
                        groupModel: groupModel),
                    itemName: 'Remove ${userData.userName.split(' ')[0]}',
                    size: size),
            ]);
  }
}
