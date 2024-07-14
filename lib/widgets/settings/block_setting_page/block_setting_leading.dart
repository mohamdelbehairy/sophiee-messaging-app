import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../models/users_model.dart';

class BlockSettingLeading extends StatelessWidget {
  const BlockSettingLeading(
      {super.key,
      required this.size,
      required this.isDark,
      required this.userData});

  final Size size;
  final bool isDark;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: size.height * .025,
        backgroundColor: Colors.transparent,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(size.height * .034),
            child: FancyShimmerImage(
                boxFit: BoxFit.cover,
                shimmerBaseColor:
                    isDark ? Colors.white12 : Colors.grey.shade300,
                shimmerHighlightColor:
                    isDark ? Colors.white24 : Colors.grey.shade100,
                imageUrl: userData.profileImage)));
  }
}
