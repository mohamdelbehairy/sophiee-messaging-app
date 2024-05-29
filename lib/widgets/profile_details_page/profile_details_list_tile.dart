import 'package:flutter/material.dart';

import '../../models/users_model.dart';
import 'profile_details_list_tile_leading.dart';
import 'profile_details_list_tile_sub_title.dart';
import 'profile_details_list_tile_title.dart';

class ProfileDetailsListTile extends StatelessWidget {
  const ProfileDetailsListTile(
      {super.key,
      required this.size,
      required this.friendData,
      required this.isDark,
      required this.widget,
      this.trailingWidget});

  final Size size;
  final UserModel friendData;
  final bool isDark;
  final Widget? widget;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title:
            ProfileDetailsListTileTitle(friendData: friendData, size: size, isDark: isDark),
        leading: ProfileDetailsListTileLeading(
            size: size, isDark: isDark, friendData: friendData, widget: widget),
        subtitle: ProfileDetailsListTileSubTitle(friendData: friendData, size: size),
        trailing: trailingWidget);
  }
}
