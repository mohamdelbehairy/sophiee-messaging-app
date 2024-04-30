import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/utils/shimmer/home/all_chats/chat_page/message_receiver_item_shimmer.dart';
import 'package:sophiee/utils/shimmer/home/all_chats/chat_page/message_sender_item_shimmer.dart';
import 'package:sophiee/utils/shimmer/home/profile/custom_item_info_card_one_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'message_page_custom_meduim_item_shimmmer.dart';
import 'message_page_receiver_item_two_shimmer.dart';
import 'message_page_send_message_item_shimmer.dart';

class MessagePageShimmer extends StatelessWidget {
  const MessagePageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    var size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.white12 : Colors.grey.shade300,
      highlightColor: isDark ? Colors.white24 : Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            MessageSenderItemShimmer(size: size),
            const SizedBox(height: 24),
            MessageReceiverItemShimmer(size: size),
            const SizedBox(height: 24),
            MessageSenderItemShimmer(size: size),
            const SizedBox(height: 24),
            MessageReceiverItemShimmer(size: size),
            const SizedBox(height: 24),
            const CustomMediumItemShimmer(
                width: 220,
                alignment: Alignment.centerRight,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    bottomLeft: Radius.circular(32))),
            const SizedBox(height: 4),
            Align(
                alignment: Alignment.centerRight,
                child: CustomItemInfoCardOneShimmer(width: size.width / 8)),
            const SizedBox(height: 24),
            CustomReceiverItemTwo(size: size),
            const SizedBox(height: 24),
            const MessagePageSendMessageItemShimmer(),
          ],
        ),
      ),
    );
  }
}
