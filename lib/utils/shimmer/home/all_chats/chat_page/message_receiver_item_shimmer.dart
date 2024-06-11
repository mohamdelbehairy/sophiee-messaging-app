import 'package:sophiee/utils/shimmer/home/profile/custom_item_info_card_one_shimmer.dart';
import 'package:flutter/material.dart';
import 'message_page_custom_meduim_item_shimmmer.dart';

class MessageReceiverItemShimmer extends StatelessWidget {
  const MessageReceiverItemShimmer({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMediumItemShimmer(
            size: size,
            width: 270,
            alignment: Alignment.centerLeft,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(32),
                topRight: Radius.circular(32))),
        const SizedBox(height: 2),
        CustomMediumItemShimmer(
          size: size,
          width: 300,
          alignment: Alignment.centerLeft,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
        ),
        const SizedBox(height: 4),
        Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Align(
                alignment: Alignment.centerLeft,
                child: CustomItemInfoCardOneShimmer(width: size.width / 8)))
      ],
    );
  }
}
