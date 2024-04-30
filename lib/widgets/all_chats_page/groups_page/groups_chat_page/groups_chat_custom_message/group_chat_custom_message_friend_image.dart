import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/my_friend_page.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getnav;

class GroupChatCustomMessageFriendImage extends StatelessWidget {
  const GroupChatCustomMessageFriendImage(
      {super.key,
      required this.size,
      required this.user,
      required this.messageModel});

  final Size size;
  final UserModel user;
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: messageModel.messageImage != null
            ? size.width * .001
            : messageModel.messageFile != null
                ? size.width * .02
                : messageModel.messageVideo != null
                    ? size.width * .0
                    : size.width * .015,
        left: size.width * .03,
        child: GestureDetector(
          onTap: () => getnav.Get.to(() => MyFriendPage(user: user),
              transition: getnav.Transition.downToUp,
              duration: const Duration(seconds: 1)),
          child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FancyShimmerImage(
                      shimmerBaseColor: Colors.grey.shade100,
                      shimmerHighlightColor: Colors.grey.shade300,
                      boxFit: BoxFit.cover,
                      imageUrl: user.profileImage))),
        ));
  }
}
