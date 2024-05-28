
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomSlidableActionItem extends StatelessWidget {
  const CustomSlidableActionItem(
      {super.key,
      required this.onPressed,
      this.lable,
      this.icon,
      this.iconColor});

  final Function(BuildContext context) onPressed;
  final String? lable;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
        icon: icon ?? Icons.delete,
        label: lable ?? 'delete',
        backgroundColor: iconColor ?? Colors.red,
        onPressed: onPressed);
  }
}
