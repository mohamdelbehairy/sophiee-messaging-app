import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_members_page/groups_chat_members_list_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsChatMembersPageListView extends StatelessWidget {
  const GroupsChatMembersPageListView(
      {super.key, required this.groupModel, required this.size, required this.isDark});
  final GroupModel groupModel;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    Color color;
    return Expanded(
        child: ListView.builder(
            itemCount: groupModel.usersID.length,
            itemBuilder: (context, index) {
              return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
                builder: (context, state) {
                  if (state is GetUserDataSuccess &&
                      state.userModel.isNotEmpty) {
                    final userID = groupModel.usersID[index];
                    final userData = state.userModel
                        .firstWhere((element) => element.userID == userID);
                    int differenceInMinutes = Timestamp.now()
                        .toDate()
                        .difference(userData.onlineStatue)
                        .inMinutes;
                    if (differenceInMinutes < 1) {
                      color = kPrimaryColor;
                    } else {
                      color = Colors.grey;
                    }
                    return GroupsChatMembersListTile(
                      isDark: isDark,
                        color: color,
                        userData: userData,
                        size: size,
                        groupModel: groupModel);
                  } else {
                    return Container();
                  }
                },
              );
            }));
  }
}
