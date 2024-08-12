import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/pages/chats/groups/groups_add_member_page.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_page/group_permissions_page.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_page/groups_chat_page_info_edit.dart';
import 'package:sophiee/utils/widget/pop_menu_info_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getnav;

class GroupsInfoPopupMenueButton extends StatelessWidget {
  const GroupsInfoPopupMenueButton(
      {super.key, required this.size, required this.groupModel});

  final Size size;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return PopupMenuButton(
      offset: Offset(0, size.height * .06),
      color:  isDark ? cardDarkModeBackground: cardLightModeBackground,
      itemBuilder: (context) => [
        if (groupModel.isAddFriends ||
            groupModel.groupOwnerID == FirebaseAuth.instance.currentUser!.uid ||
            groupModel.adminsID
                .contains(FirebaseAuth.instance.currentUser!.uid))
          groupsInfoPopMenuItem(
            isDark: isDark,
            size: size,
            itemName: 'Add member',
            onTap: () => getnav.Get.to(
                () => GroupsAddMemberPage(
                    groupModel: groupModel, size: size, isDark: isDark),
                transition: getnav.Transition.rightToLeft),
          ),
        groupsInfoPopMenuItem(
          isDark: isDark,
          size: size,
          itemName: 'Change group info',
          onTap: () {
            if (groupModel.groupOwnerID ==
                    FirebaseAuth.instance.currentUser!.uid ||
                groupModel.isMemberSettings ||
                groupModel.adminsID
                    .contains(FirebaseAuth.instance.currentUser!.uid)) {
              getnav.Get.to(
                  () => GroupsChatPageInfoEditPage(groupModel: groupModel),
                  transition: getnav.Transition.rightToLeft);
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: kPrimaryColor,
                      content: const Text(
                          'Only admins can edit this groups\'s info'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          child: const Text('Ok',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    );
                  });
            }
          },
        ),
        if (groupModel.groupOwnerID == FirebaseAuth.instance.currentUser!.uid ||
            groupModel.adminsID
                .contains(FirebaseAuth.instance.currentUser!.uid))
          groupsInfoPopMenuItem(
            isDark: isDark,
            size: size,
            itemName: 'Group permissions',
            onTap: () => getnav.Get.to(
                () => GroupPermissionsPage(size: size, groupModel: groupModel),
                transition: getnav.Transition.rightToLeft),
          ),
      ],
    );
  }
}
