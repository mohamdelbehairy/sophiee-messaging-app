import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/forward/forward_selected_friend/forward_selected_friend_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            child: Container(
              color: isSelected && selectedFriend.selectedFriendList.isNotEmpty
                  ? Colors.grey
                  : Colors.transparent,
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data.userName,
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                        )),
                    Text('Mobile',
                        style: TextStyle(
                            color: Colors.grey, fontSize: size.width * .033))
                  ],
                ),
                subtitle: Text(data.bio,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                    )),
                leading: CircleAvatar(
                  radius: size.height * .03,
                  backgroundColor: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: FancyShimmerImage(
                        boxFit: BoxFit.cover,
                        shimmerBaseColor:
                            isDark ? Colors.white12 : Colors.grey.shade300,
                        shimmerHighlightColor:
                            isDark ? Colors.white24 : Colors.grey.shade100,
                        imageUrl: data.profileImage),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
