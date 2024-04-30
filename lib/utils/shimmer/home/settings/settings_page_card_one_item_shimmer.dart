import 'package:flutter/material.dart';
import 'package:sophiee/utils/shimmer/home/profile/custom_item_info_card_one_shimmer.dart';

class SettingsPageCardOneItemShimmer extends StatelessWidget {
  const SettingsPageCardOneItemShimmer({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25)),
            ),
            const SizedBox(width: 8),
            CustomItemInfoCardOneShimmer(
                width: size.width / 4),
          ],
        ),
        CustomItemInfoCardOneShimmer(width: size.width / 14),
      ],
    );
  }
}
