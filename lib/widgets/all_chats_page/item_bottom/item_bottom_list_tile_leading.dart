import 'package:flutter/material.dart';

import '../../../models/users_model.dart';
import 'item_bottom_image.dart';
import '../item_bottom_online_statue.dart';

class ItemBottomListTileLeading extends StatelessWidget {
  const ItemBottomListTileLeading(
      {super.key,
      required this.size,
      required this.isDark,
      required this.data,
      required this.userData,
      required this.color});

  final Size size;
  final bool isDark;
  final UserModel data, userData;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ItemBottomImage(
            size: size, isDark: isDark, data: data, userData: userData),
        if (!userData.blockUsers.contains(data.userID))
          ItemBottomOnlineStatue(size: size, isDark: isDark, color: color)
      ],
    );
  }
}
