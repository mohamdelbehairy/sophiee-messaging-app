import 'package:sophiee/cubit/groups/create_groups/create_groups_cubit.dart';
import 'package:sophiee/cubit/groups/create_groups/create_groups_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/no_group_page_body_widget/no_group_page_body_widget.dart';
import 'group_page_body_widget.dart';

class GroupsPageBody extends StatelessWidget {
  const GroupsPageBody(
      {super.key,
      required this.group,
      required this.size,
      required this.isDark});

  final CreateGroupsCubit group;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupsCubit, CreateGroupsState>(
      builder: (context, state) {
        List<GroupModel> filteredGroups =
            group.userGroupsList.where((userGroup) {
          return userGroup.usersID
              .contains(FirebaseAuth.instance.currentUser!.uid);
        }).toList();
        if (filteredGroups.isNotEmpty) {
          return GroupPageBodyWidget(filteredGroups: filteredGroups);
        } else {
          return NoGroupPageBodyWidget(size: size, isDark: isDark);
        }
      },
    );
  }
}
