import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/forward/forward_selected_friend/forward_selected_friend_cubit.dart';
import 'package:sophiee/cubit/forward/forward_selected_friend/forward_selected_friend_state.dart';
import 'package:sophiee/cubit/forward/forward_selected_group/forward_selected_group_cubit.dart';
import 'package:sophiee/cubit/groups/create_groups/create_groups_cubit.dart';
import 'package:sophiee/models/media_files_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/message_forward/message_foward_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/widget/message_forward_app_bar.dart';

class MessageForwardPage extends StatelessWidget {
  const MessageForwardPage(
      {super.key, this.user, this.message, this.mediaFiles});
  final UserModel? user;
  final MessageModel? message;
  final MediaFilesModel? mediaFiles;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var isDark = context.read<LoginCubit>().isDark;
    var selectedFriend = context.read<ForwardSelectedFriendCubit>();
    selectedFriend.getSelectedFriend();
    var selectedGroup = context.read<ForwardSelectedGroupCubit>();
    selectedGroup.getSelectedGroup();
    var group = context.read<CreateGroupsCubit>();
    group.getGroups();

    return BlocBuilder<ForwardSelectedFriendCubit, ForwardSelectedFriendState>(
      builder: (context, state) {
        return BlocBuilder<ForwardSelectedGroupCubit,
            ForwardSelectedGroupState>(
          builder: (context, state) {
            return Scaffold(
              appBar: messageForwardAppBar(
                  size, selectedFriend, selectedGroup, context),
              body: MessageForwardPageBody(
                selectedFriend: selectedFriend,
                selectedGroup: selectedGroup,
                size: size,
                message: message,
                mediaFiles: mediaFiles,
                user: user,
                group: group,
                isDark: isDark,
              ),
            );
          },
        );
      },
    );
  }
}
