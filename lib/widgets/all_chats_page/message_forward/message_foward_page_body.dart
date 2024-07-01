import 'package:sophiee/cubit/forward/forward_selected_friend/forward_selected_friend_cubit.dart';
import 'package:sophiee/cubit/forward/forward_selected_group/forward_selected_group_cubit.dart';
import 'package:sophiee/cubit/groups/create_groups/create_groups_cubit.dart';
import 'package:sophiee/models/media_files_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/message_forward/message_forward_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'message_forwared_custom_scroll_view.dart';

class MessageForwardPageBody extends StatelessWidget {
  const MessageForwardPageBody(
      {super.key,
      required this.selectedFriend,
      required this.size,
      this.message,
      this.user,
      required this.group,
      required this.isDark,
      required this.selectedGroup,
      this.mediaFiles});

  final ForwardSelectedFriendCubit selectedFriend;
  final ForwardSelectedGroupCubit selectedGroup;
  final Size size;
  final MessageModel? message;
  final MediaFilesModel? mediaFiles;
  final UserModel? user;
  final CreateGroupsCubit group;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          MessageForwaredCustomScrollView(
              isDark: isDark,
              selectedGroup: selectedGroup,
              group: group,
              size: size),
          if (selectedFriend.selectedFriendList.isNotEmpty ||
              selectedGroup.selectedGroupList.isNotEmpty)
            Positioned(
                bottom: size.height * .02,
                right: size.width * .04,
                child: MessageForwardButton(
                    message: message, user: user, mediaFiles: mediaFiles))
        ],
      ),
    );
  }
}

