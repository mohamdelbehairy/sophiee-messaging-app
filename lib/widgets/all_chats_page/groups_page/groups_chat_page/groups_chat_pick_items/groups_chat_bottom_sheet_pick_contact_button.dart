import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/cubit/groups/message_group/group_message_cubit.dart';
import 'package:sophiee/cubit/pick_contact/pick_contact_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class GroupsChatBottomSheetPickContactButton extends StatefulWidget {
  const GroupsChatBottomSheetPickContactButton(
      {super.key,
      required this.groupModel,
      required this.phoneContactNumber,
      required this.phoneContactName});
  final GroupModel groupModel;
  final String phoneContactNumber;
  final String phoneContactName;

  @override
  State<GroupsChatBottomSheetPickContactButton> createState() =>
      _GroupsChatBottomSheetPickContactButtonState();
}

class _GroupsChatBottomSheetPickContactButtonState
    extends State<GroupsChatBottomSheetPickContactButton> {
  navigation() {
    Navigation.navigationOnePop(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pickContact = context.read<PickContactCubit>();
    final sendMessage = context.read<GroupMessageCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .04),
      child: GestureDetector(
        onTap: () async {
          navigation();
          await sendMessage.sendGroupMessage(
              messageID: const Uuid().v4(),
              messageText: '',
              imageUrl: null,
              videoUrl: null,
              phoneContactNumber: widget.phoneContactNumber,
              phoneContactName: widget.phoneContactName,
              groupID: widget.groupModel.groupID,
              replayImageMessage: '',
              friendNameReplay: '',
              replayMessageID: '');
          pickContact.phoneContact = null;
        },
        child: Container(
          height: size.height * .07,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * .03),
            color: Colors.blue,
          ),
          child: const Center(
            child: Text(
              'Share Contact',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
