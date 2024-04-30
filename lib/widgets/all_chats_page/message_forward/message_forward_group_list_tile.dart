import 'package:sophiee/cubit/forward/forward_selected_group/forward_selected_group_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          debugPrint('selectedgroup: ${selectedGroup.selectedGroupList.length}');
        } else {
          await selectedGroup.deleteSelectedGroups(
              groupID: widget.groupModel.groupID);
        }
      },
      child: Container(
        color: isSelected && selectedGroup.selectedGroupList.isNotEmpty
            ? Colors.grey
            : Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: widget.size.width * .01),
        child: ListTile(
          title: Text(widget.groupModel.groupName),
          leading: CircleAvatar(
            radius: widget.size.height * .03,
            backgroundColor: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: FancyShimmerImage(
                  boxFit: BoxFit.cover,
                  shimmerBaseColor:
                      widget.isDark ? Colors.white12 : Colors.grey.shade300,
                  shimmerHighlightColor:
                      widget.isDark ? Colors.white24 : Colors.grey.shade100,
                  imageUrl: widget.groupModel.groupImage!),
            ),
          ),
        ),
      ),
    );
  }
}
