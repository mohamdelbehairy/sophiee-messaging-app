import 'package:sophiee/models/users_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ShowFriendsImage extends StatelessWidget {
  const ShowFriendsImage({
    super.key,
    required this.size,
    required this.isDark,
    required this.user,
  });

  final Size size;
  final bool isDark;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: size.width * .05),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: CircleAvatar(
          radius: size.height * .028,
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size.height * .035),
            child: FancyShimmerImage(
                boxFit: BoxFit.cover,
                shimmerBaseColor: isDark ? Colors.white12 : Colors.grey.shade300,
                shimmerHighlightColor:
                    isDark ? Colors.white24 : Colors.grey.shade100,
                imageUrl: user.profileImage),
          ),
        ),
      ),
    );
  }
}
