import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_members_page/groups_chat_member_icon_actions.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_members_page/groups_chat_members_status.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsChatMembersListTile extends StatelessWidget {
  const GroupsChatMembersListTile(
      {super.key,
      required this.userData,
      required this.size,
      required this.groupModel,
      required this.color});
  final UserModel userData;
  final Size size;
  final GroupModel groupModel;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * .7,
          child: ListTile(
            title: Text(userData.userName,
                maxLines: 1, overflow: TextOverflow.ellipsis),
            subtitle: Text(userData.bio,
                maxLines: 1, overflow: TextOverflow.ellipsis),
            leading: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: FancyShimmerImage(
                        boxFit: BoxFit.cover,
                        shimmerBaseColor:
                            isDark ? Colors.white12 : Colors.grey.shade300,
                        shimmerHighlightColor:
                            isDark ? Colors.white24 : Colors.grey.shade100,
                        imageUrl: userData.profileImage),
                  ),
                ),
                Positioned(
                    right: 0.0,
                    bottom: 0.0,
                    child: GroupsChatMembersStatus(size: size, color: color)),
              ],
            ),
          ),
        ),
        GroupsChatMemebrIconActions(
            groupModel: groupModel, userData: userData, size: size),
      ],
    );
  }
}
