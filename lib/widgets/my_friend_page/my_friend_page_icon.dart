import 'package:flutter/material.dart';

import '../../models/my_friend_icon_model.dart';

class MyFriendPageIcon extends StatelessWidget {
  const MyFriendPageIcon({super.key, required this.myFriendIconModel});

  final MyFriendIconModel myFriendIconModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      right: myFriendIconModel.right,
      left: myFriendIconModel.left,
      child: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: myFriendIconModel.onPressed,
          icon: Icon(myFriendIconModel.icon,
              size: myFriendIconModel.size, color: Colors.white)),
    );
  }
}
