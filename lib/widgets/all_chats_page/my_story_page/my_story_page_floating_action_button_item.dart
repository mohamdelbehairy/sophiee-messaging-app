import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/floating_action_button_model.dart';

class MyStoryPageFloatingActionItem extends StatelessWidget {
  const MyStoryPageFloatingActionItem(
      {super.key, required this.floatingActionButtonModel});
  final FloatingActionButtonModel floatingActionButtonModel;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
        heroTag: floatingActionButtonModel.heroTag,
        backgroundColor: floatingActionButtonModel.isDark
            ? cardDarkModeBackground
            : cardLightModeBackground,
        onPressed: floatingActionButtonModel.onTap,
        child: Icon(floatingActionButtonModel.icon,
            size: 22,
            color: floatingActionButtonModel.isDark
                ? cardLightModeBackground
                : cardDarkModeBackground));
  }
}
