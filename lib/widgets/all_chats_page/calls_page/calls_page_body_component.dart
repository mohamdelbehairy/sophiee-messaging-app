import 'package:sophiee/widgets/all_chats_page/calls_page/list_tile_leading.dart';
import 'package:flutter/material.dart';

import 'list_tile_sub_title.dart';
import 'list_tile_title.dart';
import 'list_tile_trailing.dart';

class CallsPageBodyComponent extends StatelessWidget {
  const CallsPageBodyComponent(
      {super.key, required this.isDark, required this.size});
  final bool isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        horizontalTitleGap: 10,
        contentPadding: const EdgeInsets.only(left: 16),
        leading: ListTileLeading(isDark: isDark),
        title: ListTileTitle(isDark: isDark),
        subtitle: const ListTileSubTitle(),
        trailing: ListTileTrailing(size: size));
  }
}
