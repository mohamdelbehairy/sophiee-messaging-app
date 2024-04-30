import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_cubit.dart';
import 'package:sophiee/cubit/groups/groups_member_selected/groups_member_selected_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/create_group_page/create_group_custom_list_tile_vert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupListTile extends StatefulWidget {
  const CreateGroupListTile(
      {super.key,
      required this.isDark,
      required this.user,
      required this.size});

  final bool isDark;
  final UserModel user;
  final Size size;

  @override
  State<CreateGroupListTile> createState() => _CreateGroupListTileState();
}

class _CreateGroupListTileState extends State<CreateGroupListTile> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    var selectedFriends = context.read<GroupsMemberSelectedCubit>();

    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = widget.user.userID;
          final userData = state.userModel
              .firstWhere((element) => element.userID == currentUser);
          return Column(
            children: [
              GestureDetector(
                onTap: () async {
                  setState(() {
                    isSelected = !isSelected;
                  });
                  if (isSelected) {
                    await selectedFriends.groupsMemberSelected(
                        selectedFriendID: widget.user.userID,
                        userName: widget.user.userName,
                        profileImage: widget.user.profileImage,
                        userID: widget.user.userID);
                  } else {
                    await selectedFriends.deleteGroupsMemberSelectedFriends(
                        selectedFriendID: widget.user.userID);
                  }
                },
                child: BlocBuilder<GroupsMemberSelectedCubit,
                    GroupsMemberSelectedState>(
                  builder: (context, state) {
                    return CreateGroupCustomLIstTileVert(
                        userData: userData,
                        widget: widget,
                        isSelected: isSelected,
                        selectedFriends: selectedFriends);
                  },
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
