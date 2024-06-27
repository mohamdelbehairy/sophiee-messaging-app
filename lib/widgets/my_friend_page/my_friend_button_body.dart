import 'package:flutter/material.dart';

import '../../constants.dart';

class MyFriendButtonBody extends StatelessWidget {
  const MyFriendButtonBody(
      {super.key, required this.size, required this.isFollowing});

  final Size size;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .045,
      width: size.width * .2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height * .04),
          color: isFollowing ? Colors.white : kPrimaryColor,
          border: isFollowing
              ? Border.all(color: Colors.grey.withOpacity(.2))
              : Border.all(color: Colors.transparent)),
      child: Center(
        child: Text(
          isFollowing ? 'Following' : 'Follow',
          style: TextStyle(color: isFollowing ? kPrimaryColor : Colors.white),
        ),
      ),
    );
  }
}
