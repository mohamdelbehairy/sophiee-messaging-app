import 'package:sophiee/cubit/forward/forward_selected_friend/forward_selected_friend_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_state.dart';
import 'package:sophiee/models/media_files_model.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/widgets/all_chats_page/message_forward/message_forward_friend_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageForwardFriends extends StatelessWidget {
  const MessageForwardFriends(
      {super.key,
      required this.size,
      required this.isDark,
      this.message,
       
      required this.selectedFriend,
      this.mediaFiels});
  final Size size;
  final bool isDark;

  final MessageModel? message;
  final MediaFilesModel? mediaFiels;
  
  final ForwardSelectedFriendCubit selectedFriend;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: size.width * .04),
            child: Text('All Friends',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: isDark ? Colors.white : Colors.black))),
        Expanded(child: BlocBuilder<GetFriendsCubit, GetFriendsState>(
          builder: (context, state) {
            if (state is GetFriendsSuccess) {
              return ListView.builder(
                  itemCount: state.friends.length,
                  itemBuilder: (context, index) {
                    return MessageForwardFriendsListTile(
                        user: state.friends[index]);
                  });
            } else {
              return Container();
            }
          },
        )),
      ],
    );
  }
}
