import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/models/message_model.dart';

class ItemImageReplayingMessage extends StatelessWidget {
  const ItemImageReplayingMessage(
      {super.key,
      required this.size,
      required this.isDark,
      required this.message});

  final Size size;
  final bool isDark;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: size.width * .01),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: FancyShimmerImage(
              boxFit: BoxFit.cover,
              shimmerBaseColor: isDark ? Colors.white12 : Colors.grey.shade300,
              shimmerHighlightColor:
                  isDark ? Colors.white24 : Colors.grey.shade100,
              imageUrl: message.replayImageMessage!),
        ),
      ),
    );
  }
}
