import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';

import '../../../models/users_model.dart';

class ResultItemLeading extends StatelessWidget {
  const ResultItemLeading(
      {super.key, required this.isDark, required this.user});

  final bool isDark;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FancyShimmerImage(
            width: 40,
            height: 40,
            boxFit: BoxFit.cover,
            shimmerBaseColor: isDark ? Colors.white12 : Colors.grey.shade300,
            shimmerHighlightColor:
                isDark ? Colors.white24 : Colors.grey.shade100,
            imageUrl: !user.isProfilePhotos
                ? defaultProfileImageUrl
                : user.profileImage));
  }
}
