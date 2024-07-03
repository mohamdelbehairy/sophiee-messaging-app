import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/forward/forward_selected_group/forward_selected_group_cubit.dart';
import '../../../cubit/groups/create_groups/create_groups_cubit.dart';
import '../../../cubit/groups/create_groups/create_groups_state.dart';
import '../../../models/group_model.dart';
import 'message_forward_friends.dart';
import 'message_forward_groups.dart';
import 'message_forward_text_header.dart';

class MessageForwaredCustomScrollView extends StatelessWidget {
  const MessageForwaredCustomScrollView(
      {super.key,
      required this.isDark,
      required this.selectedGroup,
      required this.group,
      required this.size});

  final bool isDark;
  final ForwardSelectedGroupCubit selectedGroup;
  final CreateGroupsCubit group;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupsCubit, CreateGroupsState>(
      builder: (context, state) {
        List<GroupModel> filteredGroups =
            group.userGroupsList.where((userGroup) {
          return userGroup.usersID
              .contains(FirebaseAuth.instance.currentUser!.uid);
        }).toList();
        return CustomScrollView(
          slivers: [
            if (filteredGroups.isNotEmpty)
              SliverToBoxAdapter(
                  child: MessageForwardTextHeader(
                      isDark: isDark, text: 'Groups', top: 4)),
            if (filteredGroups.isNotEmpty)
              SliverToBoxAdapter(
                  child: MessageForwardGroups(
                      filteredGroups: filteredGroups,
                      selectedGroup: selectedGroup,
                      group: group,
                      size: size,
                      isDark: isDark)),
            SliverToBoxAdapter(
                child: MessageForwardTextHeader(
                    isDark: isDark,
                    text: 'Friends',
                    top: filteredGroups.isEmpty ? 4 : 0)),
            SliverToBoxAdapter(
              child: MessageForwardFriends(size: size, isDark: isDark),
            )
          ],
        );
      },
    );
  }
}
