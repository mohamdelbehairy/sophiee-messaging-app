import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/models/group_model.dart';

import '../../../../cubit/groups/get_groups_member/get_groups_member_cubit.dart';
import '../../../../cubit/groups/get_groups_member/get_groups_member_state.dart';
import '../../../../cubit/pick_contact/pick_contact_cubit.dart';
import '../../../../cubit/pick_contact/pick_contact_state.dart';
import '../../../../models/users_model.dart';
import '../../../../widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_pick_items/group_pick_contact/groups_chat_bottom_sheet_contact.dart';
import 'groups_chat_page_details.dart';

class GroupsChatPageSection extends StatelessWidget {
  const GroupsChatPageSection(
      {super.key,
      required this.userData,
      required this.size,
      required this.onChanged,
      required this.groupID,
      required this.scrollController,
      required this.controller,
      required this.isShowSendButton, required this.groupModel});

  final UserModel userData;
  final Size size;
  final Function(String p1) onChanged;
  final String groupID;
  final ScrollController scrollController;
  final TextEditingController controller;
  final bool isShowSendButton;
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGroupsMemberCubit, GetGroupsMemberState>(
      builder: (context, groupState) {
        if (groupState is GetGroupsMemberSuccess &&
            groupState.groupsList.isNotEmpty) {
          final groupData = groupState.groupsList
              .firstWhere((element) => element.groupID == groupID);
          return BlocBuilder<PickContactCubit, PickContactState>(
            builder: (context, state) {
              if (state is PickContactSuccess) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => GroupsChatPickContactBottomSheet(
                          groupModel: groupData,
                          phoneContactName:
                              state.phoneContact.fullName!.toString(),
                          phoneContactNumber: state
                              .phoneContact.phoneNumber!.number
                              .toString()));
                });
              }
              return GroupsChatPageDetails(
                  userData: userData,
                  size: size,
                  onChanged: onChanged,
                  groupData: groupData,
                  scrollController: scrollController,
                  controller: controller,
                  isShowSendButton: isShowSendButton);
            },
          );
        } else {
          return GroupsChatPageDetails(
                  userData: userData,
                  size: size,
                  onChanged: onChanged,
                  groupData: groupModel,
                  scrollController: scrollController,
                  controller: controller,
                  isShowSendButton: isShowSendButton);
        }
      },
    );
  }
}
