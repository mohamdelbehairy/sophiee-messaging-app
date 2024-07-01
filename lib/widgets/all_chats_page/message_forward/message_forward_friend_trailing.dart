import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../cubit/forward/forward_selected_friend/forward_selected_friend_cubit.dart';

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
        ? Container(
            height: 20,
            width: 20,
            color: kPrimaryColor,
            child: const Icon(Icons.done, size: 16, color: Colors.white))
        : Text('Mobile',
            style: TextStyle(color: Colors.grey, fontSize: size.width * .033));
  }
}
