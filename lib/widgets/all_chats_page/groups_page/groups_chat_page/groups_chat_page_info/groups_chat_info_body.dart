import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_chat_page_info/groups_chat_page_info_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupsChatInfoBody extends StatelessWidget {
  const GroupsChatInfoBody({super.key, required this.groupModel});
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GetUserDataCubit, GetUserDataStates>(
          builder: (context, state) {
            if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
              final currentUser = groupModel.groupOwnerID;
              final userData = state.userModel
                  .firstWhere((element) => element.userID == currentUser);
              return GroupsChatPageInfoDetails(
                  groupModel: groupModel, user: userData);
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
