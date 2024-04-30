import 'package:flutter/material.dart';

class CustomTabBarItem extends StatelessWidget {
  const CustomTabBarItem(
      {super.key,
      required this.size,
      required this.tabBarText,
      required this.tabBarColor,
      required this.tabBarTextSize});

  final Size size;
  final String tabBarText;
  final Color tabBarColor;
  final double tabBarTextSize;

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Text(tabBarText,
            style: TextStyle(color: tabBarColor, fontSize: tabBarTextSize)));
  }
}
