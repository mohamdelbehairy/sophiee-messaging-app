import 'package:flutter/material.dart';

import '../../../cubit/forward/forward_selected_friend/forward_selected_friend_cubit.dart';
import 'message_forward_selected_item.dart';

class MessageForwardFriendTrailing extends StatelessWidget {
  const MessageForwardFriendTrailing(
      {super.key,
      required this.selectedFriend,
      required this.isSelected,
      required this.size});
  final ForwardSelectedFriendCubit selectedFriend;
  final bool isSelected;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return isSelected && selectedFriend.selectedFriendList.isNotEmpty
        ? const MessageForwardSelectedItem()
        : Text('Mobile',
            style: TextStyle(color: Colors.grey, fontSize: size.width * .033));
  }
}

