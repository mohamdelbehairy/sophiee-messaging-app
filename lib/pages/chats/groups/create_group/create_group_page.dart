import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_app_bar.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_app_bar_leading.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_floating_action_button.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_selected_friends.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_show_selected_friend.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var groupsMembersSelected = context.read<GroupsMemberSelectedCubit>();
    return Scaffold(
      appBar: AppBar(
          titleSpacing: size.width * -.02,
          backgroundColor: kPrimaryColor,
          title: CreateGroupAppBar(
              size: size, groupsMember: groupsMembersSelected),
          leading: CreateGroupAppBarLeading(
              groupsMembersSelected: groupsMembersSelected)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreateGroupShowSelectedFriend(
              groupsMembersSelected: groupsMembersSelected, size: size),
          CreateGroupTextTitle(size: size),
          const CreateGroupSelectedFriends(),
        ],
      ),
      floatingActionButton: CreateGroupFloatingActionButton(
          size: size, groupsMembersSelected: groupsMembersSelected),
    );
  }
}
