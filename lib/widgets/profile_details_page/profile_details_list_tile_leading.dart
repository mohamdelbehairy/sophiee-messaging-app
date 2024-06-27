import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';

import '../../models/users_model.dart';

class ProfileDetailsListTileLeading extends StatelessWidget {
  const ProfileDetailsListTileLeading(
      {super.key,
      required this.size,
      required this.isDark,
      required this.friendData,
      required this.widget});

  final Size size;
  final bool isDark;
  final UserModel friendData;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
            radius: size.height * .028,
            backgroundColor: Colors.transparent,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(size.height * .03),
                child: FancyShimmerImage(
                    boxFit: BoxFit.cover,
                    shimmerBaseColor:
                        isDark ? Colors.white12 : Colors.grey.shade300,
                    shimmerHighlightColor:
                        isDark ? Colors.white24 : Colors.grey.shade100,
                    imageUrl: !friendData.isProfilePhotos
                        ? defaultProfileImageUrl
                        : friendData.profileImage))),
        if (widget != null) widget!
      ],
    );
  }
}
