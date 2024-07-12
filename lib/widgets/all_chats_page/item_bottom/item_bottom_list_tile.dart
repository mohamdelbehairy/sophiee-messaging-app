import 'package:flutter/material.dart';

import '../../models/users_model.dart';
import 'item_bottom/item_bottom_list_tile_leading.dart';
import 'item_bottom_list_tile_sub_title.dart';
import 'item_bottom_list_tile_title.dart';

class ItemBottomListTile extends StatelessWidget {
  const ItemBottomListTile(
      {super.key,
      required this.userData,
      required this.data,
      required this.user,
      required this.isMute,
      required this.size,
      required this.isDark,
      required this.color});

  final UserModel data, userData, user;

  final bool isMute;
  final Size size;
  final bool isDark;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: ItemBottomListTileTitle(
            userData: userData, data: data, user: user, isMute: isMute),
        leading: ItemBottomListTileLeading(
            size: size,
            isDark: isDark,
            data: data,
            userData: userData,
            color: color),
        subtitle: ItemBottomSubTitleListTile(user: user, data: data));
  }
}
