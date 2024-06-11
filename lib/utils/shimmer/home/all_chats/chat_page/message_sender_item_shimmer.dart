import 'package:sophiee/utils/shimmer/home/profile/custom_item_info_card_one_shimmer.dart';
import 'package:flutter/material.dart';
import 'message_page_custom_meduim_item_shimmmer.dart';

class MessageSenderItemShimmer extends StatelessWidget {
  const MessageSenderItemShimmer({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: size.height * .075,
            width: 320,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
          ),
        ),
        const SizedBox(height: 2),
        CustomMediumItemShimmer(
          size: size,
          width: 280,
          alignment: Alignment.centerRight,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
        ),
        const SizedBox(height: 4),
        Align(
            alignment: Alignment.centerRight,
            child: CustomItemInfoCardOneShimmer(width: size.width / 8)),
      ],
    );
  }
}
