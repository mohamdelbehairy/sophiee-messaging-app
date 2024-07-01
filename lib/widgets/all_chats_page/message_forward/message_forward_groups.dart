import 'package:sophiee/cubit/forward/forward_selected_group/forward_selected_group_cubit.dart';
import 'package:sophiee/cubit/groups/create_groups/create_groups_cubit.dart';
import 'package:sophiee/cubit/groups/create_groups/create_groups_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/message_forward/message_forward_group_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageForwardGroups extends StatelessWidget {
  const MessageForwardGroups(
      {super.key,
      required this.size,
      required this.isDark,
      required this.group,
      required this.selectedGroup});
  final Size size;
  final bool isDark;
  final CreateGroupsCubit group;
  final ForwardSelectedGroupCubit selectedGroup;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupsCubit, CreateGroupsState>(
      builder: (context, state) {
        List<GroupModel> filteredGroups =
            group.userGroupsList.where((userGroup) {
          return userGroup.usersID
              .contains(FirebaseAuth.instance.currentUser!.uid);
        }).toList();
        return SizedBox(
          height: size.height * .1,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: filteredGroups.length,
              itemBuilder: (context, index) {
                return MessageForwardGroupListTile(
                    size: size,
                    groupModel: filteredGroups[index],
                    isDark: isDark);
              }),
        );
      },
    );
  }
}
