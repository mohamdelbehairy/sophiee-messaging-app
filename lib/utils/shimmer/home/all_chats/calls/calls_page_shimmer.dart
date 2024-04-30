import 'package:sophiee/utils/shimmer/home/profile/custom_item_info_card_one_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CallsPageShimmer extends StatelessWidget {
  const CallsPageShimmer({super.key, required this.size, required this.isDark});
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: isDark ? Colors.white12 : Colors.grey.shade300,
            highlightColor: isDark ? Colors.white24 : Colors.grey.shade100,
            child: Row(
              children: [
                SizedBox(
                  width: size.width * .83,
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    title: Row(
                      children: [
                        CustomItemInfoCardOneShimmer(width: size.width / 3),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        CustomItemInfoCardOneShimmer(width: size.width / 1.8),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      Container(
                        height: size.height * .03,
                        width: size.height * .03,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: size.height * .03,
                        width: size.height * .03,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
