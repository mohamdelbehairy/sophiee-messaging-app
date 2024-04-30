import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_item_info_card_one_shimmer.dart';

class CustomCardThreeShimmer extends StatelessWidget {
  const CustomCardThreeShimmer(
      {super.key, required this.size, required this.isDark});
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height *.3,
      width: size.width,
      child: Card(
        color: isDark ? const Color(0xff2b2c33) : Colors.white,
        child: Shimmer.fromColors(
          baseColor: isDark ? Colors.white12 : Colors.grey.shade300,
          highlightColor: isDark ? Colors.white24 : Colors.grey.shade100,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * .03,
                    right: size.width * .02,
                    top: size.width * .04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomItemInfoCardOneShimmer(width: size.width / 8),
                    CustomItemInfoCardOneShimmer(width: size.width / 8),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
