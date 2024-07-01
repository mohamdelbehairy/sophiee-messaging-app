import 'package:cached_network_image/cached_network_image.dart';
import 'package:sophiee/cubit/forward/forward_selected_group/forward_selected_group_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/widgets/all_chats_page/message_forward/message_forward_selected_item.dart';

class MessageForwardGroupListTile extends StatefulWidget {
  const MessageForwardGroupListTile(
      {super.key,
      required this.size,
      required this.groupModel,
      required this.isDark});

  final Size size;
  final GroupModel groupModel;
  final bool isDark;

  @override
  State<MessageForwardGroupListTile> createState() =>
      _MessageForwardGroupListTileState();
}

class _MessageForwardGroupListTileState
    extends State<MessageForwardGroupListTile> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final selectedGroup = context.read<ForwardSelectedGroupCubit>();
    return GestureDetector(
      onTap: () async {
        setState(() {
          isSelected = !isSelected;
        });

        if (isSelected) {
          await selectedGroup.selectedGroup(
              groupID: widget.groupModel.groupID,
              groupName: widget.groupModel.groupName);
          debugPrint('groupID: ${widget.groupModel.groupID}');
          debugPrint('groupName: ${widget.groupModel.groupName}');
          debugPrint(
              'selectedgroup: ${selectedGroup.selectedGroupList.length}');
        } else {
          await selectedGroup.deleteSelectedGroups(
              groupID: widget.groupModel.groupID);
        }
      },
      child: Container(
        width: widget.size.width * .2,
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                    radius: widget.size.height * .03,
                    backgroundColor: Colors.transparent,
                    backgroundImage: CachedNetworkImageProvider(
                        widget.groupModel.groupImage!)),
                if (isSelected && selectedGroup.selectedGroupList.isNotEmpty)
                  const Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: MessageForwardSelectedItem())
              ],
            ),
            Text(widget.groupModel.groupName.split(' ')[0],
                style: const TextStyle(color: Colors.grey))
          ],
        ),
      ),
    );
  }
}
