import 'package:flutter/material.dart';

import '../../cubit/forward/forward_selected_friend/forward_selected_friend_cubit.dart';
import '../../cubit/forward/forward_selected_group/forward_selected_group_cubit.dart';
import '../../cubit/groups/create_groups/create_groups_cubit.dart';
import '../../utils/widget/message_forward_app_bar.dart';
import '../all_chats_page/message_forward/message_forwared_custom_scroll_view.dart';

class ReceiveSharingPageBody extends StatelessWidget {
  const ReceiveSharingPageBody(
      {super.key,
      required this.size,
      required this.selectedFriend,
      required this.selectedGroup,
      required this.isDark,
      required this.group});

  final Size size;
  final ForwardSelectedFriendCubit selectedFriend;
  final ForwardSelectedGroupCubit selectedGroup;
  final bool isDark;
  final CreateGroupsCubit group;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          messageForwardAppBar(size, selectedFriend, selectedGroup, context),
      body: MessageForwaredCustomScrollView(
          isDark: isDark,
          selectedGroup: selectedGroup,
          group: group,
          size: size),
    );
  }
}
