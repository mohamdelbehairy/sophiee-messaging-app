import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/pages/chats/groups/groups_chat_page/groups_chat_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/group_model.dart';

class GroupsChatPage extends StatefulWidget {
  const GroupsChatPage({super.key, required this.groupID, this.groupModel});
  final String groupID;
  final GroupModel? groupModel;

  @override
  State<GroupsChatPage> createState() => _GroupsChatPageState();
}

class _GroupsChatPageState extends State<GroupsChatPage> {
  final scrollController = ScrollController();
  late TextEditingController controller;
  bool isShowSendButton = false;

  @override
  void initState() {
    controller = TextEditingController();
    context.read<GroupMessageCubit>().getGroupMessage(groupID: widget.groupID);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GroupsChatPageBody(
      groupModel: widget.groupModel,
      groupID: widget.groupID,
      size: size,
      scrollController: scrollController,
      controller: controller,
      isShowSendButton: isShowSendButton,
      onChanged: (value) {
        setState(() {
          isShowSendButton = value.trim().isNotEmpty;
        });
      },
    );
  }
}
