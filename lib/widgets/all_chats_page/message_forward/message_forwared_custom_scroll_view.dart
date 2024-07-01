import 'package:flutter/material.dart';

import '../../../cubit/forward/forward_selected_group/forward_selected_group_cubit.dart';
import '../../../cubit/groups/create_groups/create_groups_cubit.dart';
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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: MessageForwardTextHeader(
                isDark: isDark, text: 'All Groups', top: 4)),
        SliverToBoxAdapter(
            child: MessageForwardGroups(
                selectedGroup: selectedGroup,
                group: group,
                size: size,
                isDark: isDark)),
        SliverToBoxAdapter(
            child:
                MessageForwardTextHeader(isDark: isDark, text: 'All Friends')),
        SliverToBoxAdapter(
          child: MessageForwardFriends(size: size, isDark: isDark),
        )
      ],
    );
  }
}
