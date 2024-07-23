import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
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
    var isDark = context.read<LoginCubit>().isDark;

    return PopupMenuButton(
        icon: Icon(FontAwesomeIcons.ellipsisVertical, size: size.width * .05),
        color: isDark ? cardDarkModeBackground : cardLightModeBackground,
        itemBuilder: (context) => [
              PopupMenuItem(
                  child: Row(
                children: [
                  Icon(Icons.star,
                      size: size.width * .04,
                      color: isDark ? Colors.white : Colors.black),
                  SizedBox(width: size.width * .025),
                  Text('Favourite',
                      style: TextStyle(
                          color: isDark ? Colors.white : Colors.black))
                ],
              )),
              PopupMenuItem(
                  child: Row(
                children: [
                  Icon(Icons.volume_up,
                      size: size.width * .04,
                      color: isDark ? Colors.white : Colors.black),
                  SizedBox(width: size.width * .025),
                  Text('Mute',
                      style: TextStyle(
                          color: isDark ? Colors.white : Colors.black))
                ],
              )),
              PopupMenuItem(
                  onTap: () {
                    customShowDialog(
                        context: context,
                        doneButtonText: 'Ok',
                        // backgroundColor: kPrimaryColor,
                        isDark: isDark,
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
                          size: size.width * .04,
                          color: isDark ? Colors.white : Colors.black),
                      SizedBox(width: size.width * .025),
                      Text(
                          groupModel.groupOwnerID ==
                                  FirebaseAuth.instance.currentUser!.uid
                              ? 'Delete and Leave Group'
                              : 'Leave Group',
                          style: TextStyle(
                              color: isDark ? Colors.white : Colors.black))
                    ],
                  )),
            ]);
  }
}
