import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../cubit/forward/forward_selected_friend/forward_selected_friend_cubit.dart';
import '../../cubit/forward/forward_selected_group/forward_selected_group_cubit.dart';

AppBar messageForwardAppBar(
    Size size,
    ForwardSelectedFriendCubit selectedFriend,
    ForwardSelectedGroupCubit selectedGroup,BuildContext context) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    titleSpacing: size.width * -.02,
    title: Text(
        selectedFriend.selectedFriendList.isNotEmpty ||
                selectedGroup.selectedGroupList.isNotEmpty
            ? '${selectedFriend.selectedFriendList.length + selectedGroup.selectedGroupList.length} selected'
            : 'Forward to...',
        style: const TextStyle(
            fontWeight: FontWeight.normal, color: Colors.white)),
    leading: GestureDetector(
        onTap: () async {
          Navigator.pop(context);
          await selectedFriend.deleteAllSelectedFriends();
          await selectedGroup.deleteAllSelectedGroups();
        },
        child: Icon(Icons.arrow_back,
            color: Colors.white, size: size.width * .08)),
  );
}
