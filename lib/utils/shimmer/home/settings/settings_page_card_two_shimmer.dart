import 'package:sophiee/utils/shimmer/home/settings/settings_page_card_one_item_shimmer.dart';
import 'package:sophiee/utils/shimmer/home/settings/settings_page_card_two_item_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../constants.dart';

class SettingsPageCardTwoShimmer extends StatelessWidget {
  const SettingsPageCardTwoShimmer(
      {super.key, required this.isDark, required this.size});
  final bool isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        color: isDark ? cardDarkModeBackground : Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Shimmer.fromColors(
            baseColor: isDark ? Colors.white12 : Colors.grey.shade300,
            highlightColor: isDark ? Colors.white24 : Colors.grey.shade100,
            child: Column(
              children: [
                SettingsPageCardTwoItemShimmer(size: size),
                const SizedBox(height: 16),
                SettingsPageCardOneItemShimmer(size: size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
