import 'package:flutter/material.dart';
import 'message_page_custom_meduim_item_shimmmer.dart';

class MessagePageSendMessageItemShimmer extends StatelessWidget {
  const MessagePageSendMessageItemShimmer({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomMediumItemShimmer(
            size: size,
            width: MediaQuery.sizeOf(context).width * .75,
            alignment: Alignment.center,
            borderRadius: BorderRadius.circular(32)),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
        )
      ],
    );
  }
}
