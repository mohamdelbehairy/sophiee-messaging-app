import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';

import '../cubit/forward/forward_selected_friend/forward_selected_friend_cubit.dart';
import '../cubit/forward/forward_selected_friend/forward_selected_friend_state.dart';
import '../cubit/forward/forward_selected_group/forward_selected_group_cubit.dart';
import '../cubit/groups/create_groups/create_groups_cubit.dart';
import '../widgets/receive_sharing_page/receive_sharing_page_body.dart';

class ReceiveSharingPage extends StatelessWidget {
  const ReceiveSharingPage({super.key, required this.sharedFiles});
  final List<SharedMediaFile> sharedFiles;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isDark = context.read<LoginCubit>().isDark;

    var selectedFriend = context.read<ForwardSelectedFriendCubit>();
    selectedFriend.getSelectedFriend();
    var selectedGroup = context.read<ForwardSelectedGroupCubit>();
    selectedGroup.getSelectedGroup();
    var group = context.read<CreateGroupsCubit>();
    group.getGroups();

    return BlocBuilder<ForwardSelectedFriendCubit, ForwardSelectedFriendState>(
      builder: (context, friendState) {
        return BlocBuilder<ForwardSelectedGroupCubit,
            ForwardSelectedGroupState>(
          builder: (context, groupState) {
            return ReceiveSharingPageBody(
                size: size,
                sharedFiles: sharedFiles,
                group: group,
                selectedFriend: selectedFriend,
                selectedGroup: selectedGroup,
                isDark: isDark);
          },
        );
      },
    );
  }
}
