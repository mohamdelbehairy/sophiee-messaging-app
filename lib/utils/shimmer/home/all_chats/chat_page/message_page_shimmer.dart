import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/utils/shimmer/home/all_chats/chat_page/message_receiver_item_shimmer.dart';
import 'package:sophiee/utils/shimmer/home/all_chats/chat_page/message_sender_item_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

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
            SizedBox(height: size.width * .03),
            MessageSenderItemShimmer(size: size),
            SizedBox(height: size.width * .025),
            MessageReceiverItemShimmer(size: size),
            SizedBox(height: size.width * .025),
            MessageSenderItemShimmer(size: size),
            SizedBox(height: size.width * .025),
            MessageReceiverItemShimmer(size: size),
            SizedBox(height: size.width * .025),
            SizedBox(height: size.width * .025),
            MessageSenderItemShimmer(size: size),
            SizedBox(height: size.width * .02),
            CustomReceiverItemTwo(size: size),
            SizedBox(height: size.width * .02),
            MessagePageSendMessageItemShimmer(size: size),
          ],
        ),
      ),
    );
  }
}
