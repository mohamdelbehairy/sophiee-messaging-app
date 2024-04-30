import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/groups/delete_groups/delete_groups_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/utils/custom_show_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomPopMenuButton extends StatelessWidget {
  const CustomPopMenuButton(
      {super.key, required this.size, required this.groupModel});

  final Size size;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    var deleteGroup = context.read<DeleteGroupsCubit>();
    return PopupMenuButton(
        icon: Icon(FontAwesomeIcons.ellipsisVertical, size: size.width * .05),
        itemBuilder: (context) => [
              PopupMenuItem(
                  child: Row(
                children: [
                  Icon(Icons.star, size: size.width * .04, color: Colors.black),
                  SizedBox(width: size.width * .025),
                  const Text('Favourite')
                ],
              )),
              PopupMenuItem(
                  child: Row(
                children: [
                  Icon(Icons.volume_up,
                      size: size.width * .04, color: Colors.black),
                  SizedBox(width: size.width * .025),
                  const Text('Mute')
                ],
              )),
              PopupMenuItem(
                  onTap: () {
                    customShowDialog(
                        context: context,
                        doneButtonText: 'Ok',
                        backgroundColor: kPrimaryColor,
                        contentText: groupModel.groupOwnerID ==
                                FirebaseAuth.instance.currentUser!.uid
                            ? 'Are you sure to delete ${groupModel.groupName} group?'
                            : 'Are you sure to leave ${groupModel.groupName} group?',
                        okFunction: () async {
                          Navigator.pop(context);
                          if (groupModel.groupOwnerID ==
                              FirebaseAuth.instance.currentUser!.uid) {
                            await deleteGroup.deleteAndLeaveGroupOwner(
                                groupID: groupModel.groupID);
                          } else {
                            await deleteGroup.leaveGroupMember(
                                groupID: groupModel.groupID);
                          }
                        });
                  },
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.arrowRightFromBracket,
                          size: size.width * .04, color: Colors.black),
                      SizedBox(width: size.width * .025),
                      Text(groupModel.groupOwnerID ==
                              FirebaseAuth.instance.currentUser!.uid
                          ? 'Delete and Leave Group'
                          : 'Leave Group')
                    ],
                  )),
            ]);
  }
}
