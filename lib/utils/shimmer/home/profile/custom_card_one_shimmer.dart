import 'package:sophiee/utils/shimmer/home/profile/custom_item_info_card_one_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomCardOneShimmer extends StatelessWidget {
  const CustomCardOneShimmer({super.key, required this.size, required this.isDark});
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {

    return  SizedBox(
      height: size.height * .39,
      child: Card(
        color: isDark ? const Color(0xff2b2c33):Colors.white,
        child: Shimmer.fromColors(
          baseColor: isDark ? Colors.white12 : Colors.grey.shade300,
          highlightColor: isDark ? Colors.white24 : Colors.grey.shade100,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(25)),
                  ),
                  title: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      CustomItemInfoCardOneShimmer(
                          width: size.width / 2),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: CustomItemInfoCardOneShimmer(
                            width: size.width / 12),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      CustomItemInfoCardOneShimmer(
                          width: size.width / 4),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * .02),
              Container(
                height: size.height * .18,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: size.height * .02),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                children: [
                  CustomItemInfoCardOneShimmer(
                      width: size.width / 8),
                  CustomItemInfoCardOneShimmer(
                      width: size.width / 8),
                  CustomItemInfoCardOneShimmer(
                      width: size.width / 8),
                ],
              ),
              SizedBox(height: size.height * .01),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                children: [
                  CustomItemInfoCardOneShimmer(
                      width: size.width / 8),
                  CustomItemInfoCardOneShimmer(
                      width: size.width / 8),
                  CustomItemInfoCardOneShimmer(
                      width: size.width / 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
