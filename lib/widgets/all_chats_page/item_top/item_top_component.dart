import 'package:flutter/material.dart';

import '../../../models/users_model.dart';
import 'item_top_image.dart';
import 'item_top_live_item.dart';
import 'item_top_online_state.dart';

class ItemTopComponent extends StatelessWidget {
  const ItemTopComponent(
      {super.key,
      required this.data,
      required this.size,
      required this.isDark,
      required this.color});

  final UserModel data;
  final Size size;
  final bool isDark;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: data.isLive ? Alignment.bottomCenter : Alignment.bottomRight,
      children: [
        ItemTopImage(size: size, data: data, isDark: isDark),
        if (!data.isLive)
          ItemTopOnlineStateItem(size: size, isDark: isDark, color: color),
        if (data.isLive) const ItemTopLiveItem()
      ],
    );
  }
}
