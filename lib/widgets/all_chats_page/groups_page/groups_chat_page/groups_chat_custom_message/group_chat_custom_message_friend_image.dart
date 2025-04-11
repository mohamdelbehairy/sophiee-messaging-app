import 'package:sophiee/constants.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/my_friend_page.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/utils/widget/flutter_toast_widget.dart';

class GroupChatCustomMessageFriendImage extends StatelessWidget {
  const GroupChatCustomMessageFriendImage(
      {super.key,
      required this.size,
      required this.user,
      required this.messageModel,
      required this.userData});

  final Size size;
  final UserModel user, userData;
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
        left: size.width * .02,
        child: GestureDetector(
          onTap: () {
            if (!userData.blockUsers.contains(user.userID) &&
                !user.blockUsers.contains(userData.userID)) {
              Navigation.push(context, MyFriendPage(user: user));
            } else if (userData.blockUsers.contains(user.userID)) {
              FlutterToastWidget.showToast(
                  msg: 'You blocked ${user.userName.split(" ")[0]}');
            } else {
              FlutterToastWidget.showToast(
                  msg: '${user.userName.split(" ")[0]} is blocked you');
            }
          },
          child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FancyShimmerImage(
                      shimmerBaseColor: Colors.grey.shade100,
                      shimmerHighlightColor: Colors.grey.shade300,
                      boxFit: BoxFit.cover,
                      imageUrl: !user.isProfilePhotos ||
                              userData.blockUsers.contains(user.userID) ||
                              user.blockUsers.contains(userData.userID)
                          ? defaultProfileImageUrl
                          : user.profileImage))),
        ));
  }
}
