  import 'package:flutter/material.dart';
import 'package:sophiee/utils/widget/custom_tab_bar_item.dart';

PreferredSize profileDetailsAppBarPreferredSize(
      {required Function(int) onTap,
      required int index,
      required Size size,
      required int titleIndex}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Expanded(
        child: TabBar(
          indicatorColor: Colors.white,
          indicatorPadding:
              EdgeInsets.symmetric(horizontal: size.width * 0.02),
          onTap: onTap,
          tabs: [
            CustomTabBarItem(
                size: size,
                tabBarText: 'Followers',
                tabBarColor: index == 0 ? Colors.white : Colors.white60,
                tabBarTextSize:
                    index == 0 ? size.width * .035 : size.width * .03),
            CustomTabBarItem(
                size: size,
                tabBarText: 'Follower',
                tabBarColor: index == 1 ? Colors.white : Colors.white60,
                tabBarTextSize:
                    index == 1 ? size.width * .035 : size.width * .03),
            CustomTabBarItem(
                size: size,
                tabBarText: 'Friends',
                tabBarColor: titleIndex == 2 ? Colors.white : Colors.white60,
                tabBarTextSize:
                    titleIndex == 2 ? size.width * .035 : size.width * .03),
          ],
        ),
      ),
    );
  }