import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sophiee/utils/shimmer/home/profile/custom_item_info_card_one_shimmer.dart';

class BottomNavigationShimmer extends StatelessWidget {
  const BottomNavigationShimmer({super.key, required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: isDark ? const Color(0xff2b2c33) : Colors.white10,
      height: size.height * .09,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.only(
            left: size.height * .05,
            right: size.height * .05,
            bottom: size.height * .02),
        child: Shimmer.fromColors(
          baseColor: isDark ? Colors.white12 : Colors.grey.shade300,
          highlightColor: isDark ? Colors.white24 : Colors.grey.shade100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomItemInfoCardOneShimmer(width: size.width / 10),
              CustomItemInfoCardOneShimmer(width: size.width / 10),
              CustomItemInfoCardOneShimmer(width: size.width / 10),
            ],
          ),
        ),
      ),
    );
  }
}
