import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sophiee/constants.dart';

import 'custom_item_info_card_one_shimmer.dart';

class CustomCardTwoShimmer extends StatelessWidget {
  const CustomCardTwoShimmer(
      {super.key, required this.size, required this.isDark});
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height * .14,
        width: size.width,
        child: Card(
          color: isDark ? kDarkModeColor : Colors.white,
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
                SizedBox(
                  height: 62,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 11, top: 12),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
