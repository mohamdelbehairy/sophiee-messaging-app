import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';

import '../../models/users_model.dart';

class MyFriendPageImage extends StatelessWidget {
  const MyFriendPageImage({super.key, required this.user, required this.size});

  final UserModel user;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
        imageUrl: user.isProfilePhotos ? user.profileImage : defaultProfileImageUrl,
        height: size.height * .55,
        width: size.width);
  }
}
  // Container(
        //   height: size.height * .5,
        //   decoration: BoxDecoration(
        //     boxShadow: [
        //       BoxShadow(
        //         color: isDark ? Colors.white60.withOpacity(.25) : Colors.grey,
        //         blurRadius: 30,
        //         offset: const Offset(10, 10),
        //       )
        //     ],
        //     image: DecorationImage(
        //       image: CachedNetworkImageProvider(user.profileImage),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
