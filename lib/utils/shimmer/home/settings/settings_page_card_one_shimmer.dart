import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sophiee/utils/shimmer/home/settings/settings_page_card_one_item_shimmer.dart';

import '../../../../constants.dart';

class SettingsPageCardOneShimmer extends StatelessWidget {
  const SettingsPageCardOneShimmer({super.key, required this.isDark, required this.size});
  final bool isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
      child: Card(
        color: isDark ? cardDarkModeBackground : Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Shimmer.fromColors(
            baseColor: isDark ? Colors.white12 : Colors.grey.shade300,
            highlightColor:
            isDark ? Colors.white24 : Colors.grey.shade100,
            child: Column(
              children: [
                SettingsPageCardOneItemShimmer(size: size),
                const SizedBox(height: 16),
                SettingsPageCardOneItemShimmer(size: size),
                const SizedBox(height: 16),
                SettingsPageCardOneItemShimmer(size: size),
                const SizedBox(height: 16),
                SettingsPageCardOneItemShimmer(size: size),
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
