import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../models/users_model.dart';
import 'groups_chat_members_status.dart';

class GroupChatMemberLeading extends StatelessWidget {
  const GroupChatMemberLeading(
      {super.key,
      required this.isDark,
      required this.membersData,
      required this.userData,
      required this.size,
      required this.color});

  final bool isDark;
  final UserModel membersData, userData;

  final Size size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
            backgroundColor: Colors.transparent,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: FancyShimmerImage(
                    boxFit: BoxFit.cover,
                    shimmerBaseColor:
                        isDark ? Colors.white12 : Colors.grey.shade300,
                    shimmerHighlightColor:
                        isDark ? Colors.white24 : Colors.grey.shade100,
                    imageUrl: !membersData.isProfilePhotos ||
                            (membersData.userID != userData.userID &&
                                (membersData.blockUsers
                                        .contains(userData.userID) ||
                                    userData.blockUsers
                                        .contains(membersData.userID)))
                        ? defaultProfileImageUrl
                        : membersData.profileImage))),
        if (membersData.userID != userData.userID &&
            !membersData.blockUsers.contains(userData.userID) &&
            !userData.blockUsers.contains(membersData.userID))
          Positioned(
              right: 0.0,
              bottom: 0.0,
              child: GroupsChatMembersStatus(
                  membersData: membersData,
                  size: size,
                  color: color,
                  isDark: isDark)),
      ],
    );
  }
}
