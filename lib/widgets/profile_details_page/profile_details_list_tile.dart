import 'package:flutter/material.dart';

import '../../models/users_model.dart';
import 'profile_details_list_tile_leading.dart';
import 'profile_details_list_tile_sub_title.dart';
import 'profile_details_list_tile_title.dart';

class ProfileDetailsListTile extends StatelessWidget {
  const ProfileDetailsListTile(
      {super.key,
      required this.size,
      required this.data,
      required this.isDark,
      required this.widget,
      this.trailingWidget});

  final Size size;
  final UserModel data;
  final bool isDark;
  final Widget? widget;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.width * .04),
      child: ListTile(
        title:
            ProfileDetailsListTileTitle(data: data, size: size, isDark: isDark),
        leading: ProfileDetailsListTileLeading(
            size: size, isDark: isDark, data: data, widget: widget),
        subtitle: ProfileDetailsListTileSubTitle(data: data, size: size),
        trailing: trailingWidget,
      ),
    );
  }
}
