import 'package:sophiee/utils/shimmer/home/profile/custom_item_info_card_one_shimmer.dart';
import 'package:flutter/material.dart';
import 'message_page_custom_meduim_item_shimmmer.dart';

class CustomReceiverItemTwo extends StatelessWidget {
  const CustomReceiverItemTwo({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
             CustomMediumItemShimmer(
               size: size,
                width: 270,
                alignment: Alignment.centerLeft,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(32),
                    topRight: Radius.circular(32))),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomItemInfoCardOneShimmer(width: size.width / 8),
              ),
            ),
          ],
        ),
        // Positioned(
        //   top: 0.0,
        //   left: 0.0,
        //   child: Container(
        //     height: 40,
        //     width: 40,
        //     decoration: BoxDecoration(
        //         color: Colors.white, borderRadius: BorderRadius.circular(25)),
        //   ),
        // ),
      ],
    );
  }
}
