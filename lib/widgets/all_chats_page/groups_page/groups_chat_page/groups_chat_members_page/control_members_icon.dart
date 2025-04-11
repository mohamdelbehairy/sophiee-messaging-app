import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/my_friend_page.dart';
import 'package:sophiee/pages/chats/chat_page.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/utils/widget/pop_menu_info_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../cubit/groups/groups_members_details/groups_members_details_cubit.dart';
import 'remove_member_show_dialog.dart';

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
    var isDark = context.read<LoginCubit>().isDark;
    return PopupMenuButton(
        color: isDark ? cardDarkModeBackground : cardLightModeBackground,
        offset: Offset(0, size.height * .05),
        icon: Icon(FontAwesomeIcons.ellipsisVertical,
            color: Colors.grey, size: size.width * .05),
        itemBuilder: (context) => [
              groupsInfoPopMenuItem(
                  isDark: isDark,
                  onTap: () => Navigation.push(
                      context, ChatPage(userID: userData.userID)),
                  itemName: 'Message ${userData.userName.split(' ')[0]}',
                  size: size),
              groupsInfoPopMenuItem(
                  isDark: isDark,
                  onTap: () =>
                      Navigation.push(context, MyFriendPage(user: userData)),
                  itemName: 'View ${userData.userName.split(' ')[0]}',
                  size: size),
              if (groupModel.groupOwnerID ==
                  FirebaseAuth.instance.currentUser!.uid)
                groupsInfoPopMenuItem(
                    isDark: isDark,
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
                    isDark: isDark,
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
