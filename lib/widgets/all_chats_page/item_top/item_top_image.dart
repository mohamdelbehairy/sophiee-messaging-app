import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/users_model.dart';

class ItemTopImage extends StatelessWidget {
  const ItemTopImage(
      {super.key,
      required this.size,
      required this.data,
      required this.isDark});

  final Size size;
  final UserModel data;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: size.height * .035,
        backgroundColor: data.isStory ? kPrimaryColor : Colors.grey,
        child: CircleAvatar(
            radius: size.height * .033,
            backgroundColor: isDark ? cardDarkModeBackground : Colors.white,
            child: CircleAvatar(
                radius: size.height * .031,
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(size.height * .035),
                    child: FancyShimmerImage(
                        boxFit: BoxFit.cover,
                        shimmerBaseColor:
                            isDark ? Colors.white12 : Colors.grey.shade300,
                        shimmerHighlightColor:
                            isDark ? Colors.white24 : Colors.grey.shade100,
                        imageUrl: !data.isProfilePhotos
                            ? defaultProfileImageUrl
                            : data.profileImage)))));
  }
}
