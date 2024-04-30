import 'package:flutter/material.dart';
import 'package:sophiee/utils/widget/custom_tab_bar_item.dart';

class MediaFilesPageTabBar extends StatelessWidget {
  const MediaFilesPageTabBar(
      {super.key,
      required this.size,
      required this.titleIndex,
      required this.onTap});

  final Size size;
  final int titleIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBar(
        indicatorColor: Colors.white,
        indicatorPadding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        onTap: onTap,
        tabs: [
          CustomTabBarItem(
              tabBarText: 'Media',
              tabBarColor: titleIndex == 0 ? Colors.white : Colors.white60,
              tabBarTextSize:
                  titleIndex == 0 ? size.width * .035 : size.width * .03,
              size: size),
          CustomTabBarItem(
              tabBarText: 'Files',
              tabBarColor: titleIndex == 1 ? Colors.white : Colors.white60,
              tabBarTextSize:
                  titleIndex == 1 ? size.width * .035 : size.width * .03,
              size: size),
          CustomTabBarItem(
              tabBarText: 'Links',
              tabBarColor: titleIndex == 2 ? Colors.white : Colors.white60,
              tabBarTextSize:
                  titleIndex == 2 ? size.width * .035 : size.width * .03,
              size: size),
          CustomTabBarItem(
              tabBarText: 'Voice',
              tabBarColor: titleIndex == 3 ? Colors.white : Colors.white60,
              tabBarTextSize:
                  titleIndex == 3 ? size.width * .035 : size.width * .03,
              size: size),
        ],
      ),
    );
  }
}
