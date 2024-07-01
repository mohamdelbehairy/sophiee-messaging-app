import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/forward/forward_selected_friend/forward_selected_friend_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'message_forward_friend_leading.dart';
import 'message_forward_friend_trailing.dart';

class MessageForwardFriendsListTile extends StatefulWidget {
  const MessageForwardFriendsListTile({super.key, required this.user});

  final UserModel user;

  @override
  State<MessageForwardFriendsListTile> createState() =>
      _MessageForwardFriendsListTileState();
}

class _MessageForwardFriendsListTileState
    extends State<MessageForwardFriendsListTile> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    final size = MediaQuery.of(context).size;
    final selectedFriend = context.read<ForwardSelectedFriendCubit>();
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = widget.user.userID;
          final data = state.userModel
              .firstWhere((element) => element.userID == currentUser);
          return GestureDetector(
            onTap: () async {
              setState(() {
                isSelected = !isSelected;
              });
              if (isSelected) {
                await selectedFriend.selectedFriend(
                    selectedFriendID: data.userID,
                    userName: data.userName,
                    profileImage: data.profileImage,
                    userID: data.userID);
              } else {
                await selectedFriend.deleteSelectedFriend(
                    selectedFriendID: data.userID);
              }
            },
            child: ListTile(
                title: Text(data.userName,
                    style: TextStyle(
                        color: isDark ? Colors.white : Colors.black)),
                trailing: MessageForwardFriendTrailing(
                    isSelected: isSelected,
                    size: size,
                    selectedFriend: selectedFriend),
                subtitle: Text(
                    data.isBioAndNickName
                        ? data.bio.isNotEmpty
                            ? data.bio
                            : data.nickName
                        : '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey)),
                leading: MessageForwardFriendLeading(
                    size: size, isDark: isDark, data: data)),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

