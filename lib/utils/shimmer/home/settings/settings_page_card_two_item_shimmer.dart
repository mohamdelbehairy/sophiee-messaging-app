import 'package:flutter/material.dart';
import 'package:sophiee/utils/shimmer/home/profile/custom_item_info_card_one_shimmer.dart';

class SettingsPageCardTwoItemShimmer extends StatelessWidget {
  const SettingsPageCardTwoItemShimmer({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return  Row(
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
    );
  }
}
