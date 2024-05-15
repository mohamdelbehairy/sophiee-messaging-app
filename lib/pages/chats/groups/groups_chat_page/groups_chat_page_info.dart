import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/groups/get_groups_member/get_groups_member_cubit.dart';
import 'package:sophiee/cubit/groups/get_groups_member/get_groups_member_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_info/groups_chat_info_body.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_info/groups_chat_page_info_app_bar.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_info/groups_info_pop_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsChatPageInfo extends StatelessWidget {
  const GroupsChatPageInfo(
      {super.key,
      required this.groupModel,
      required this.size,
      required this.isDark});
  final GroupModel groupModel;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: const GroupsChatPageInfoAppBar(),
          actions: [
            BlocBuilder<GetGroupsMemberCubit, GetGroupsMemberState>(
              builder: (context, state) {
                if (state is GetGroupsMemberSuccess &&
                    state.groupsList.isNotEmpty) {
                  final groupID = groupModel.groupID;
                  final groupData = state.groupsList
                      .firstWhere((element) => element.groupID == groupID);
                  return GroupsInfoPopupMenueButton(
                      size: size, groupModel: groupData);
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
        body: GroupsChatInfoBody(groupModel: groupModel, size: size,isDark: isDark));
  }
}
