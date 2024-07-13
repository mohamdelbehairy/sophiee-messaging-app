import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'group_chat_member_leading.dart';
import 'group_chat_member_title.dart';
import 'groups_chat_member_icon_actions.dart';

class GroupsChatMembersListTile extends StatelessWidget {
  const GroupsChatMembersListTile(
      {super.key,
      required this.membersData,
      required this.size,
      required this.groupModel,
      required this.color,
      required this.isDark,
      required this.userData});
  final UserModel membersData, userData;
  final Size size;
  final GroupModel groupModel;
  final Color color;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: size.width * .72,
            child: ListTile(
                title: GroupChatMemberTitle(
                    membersData: membersData, isDark: isDark),
                subtitle: !membersData.blockUsers.contains(userData.userID) &&
                        !userData.blockUsers.contains(membersData.userID)
                    ? Text(
                        membersData.isBioAndNickName
                            ? membersData.bio.isNotEmpty
                                ? membersData.bio
                                : membersData.nickName
                            : '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: isDark ? Colors.white60 : Colors.grey,
                            fontSize: 12))
                    : null,
                leading: GroupChatMemberLeading(
                    isDark: isDark,
                    membersData: membersData,
                    userData: userData,
                    size: size,
                    color: color))),
        GroupsChatMemebrIconActions(
            userData: userData,
            groupModel: groupModel,
            membersData: membersData,
            size: size),
      ],
    );
  }
}
