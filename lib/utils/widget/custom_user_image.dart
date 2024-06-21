import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';

import '../../models/users_model.dart';

class CustomUserImage extends StatelessWidget {
  const CustomUserImage(
      {super.key, required this.user, required this.size, this.hight});

  final UserModel user;
  final Size size;
  final double? hight;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
        imageUrl:
            user.isProfilePhotos ? user.profileImage : defaultProfileImageUrl,
        height: hight ?? size.height * .55,
        width: size.width);
  }
}
