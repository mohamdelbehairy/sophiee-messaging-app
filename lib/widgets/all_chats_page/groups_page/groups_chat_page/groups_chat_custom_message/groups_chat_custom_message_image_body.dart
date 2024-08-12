import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GroupsChatCustomMessageImageBody extends StatelessWidget {
  const GroupsChatCustomMessageImageBody(
      {super.key, required this.size, required this.message});

  final Size size;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: size.height * .4,
      width: size.width * .75,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: message.senderID == FirebaseAuth.instance.currentUser!.uid
                  ? Radius.circular(message.replayTextMessage != '' ||
                          message.replayImageMessage != '' ||
                          message.replayFileMessage != '' ||
                          message.replayContactMessage != '' ||
                          message.replaySoundMessage != '' ||
                          message.replayRecordMessage != ''
                      ? 0
                      : 24)
                  : const Radius.circular(4),
              bottomLeft:
                  message.senderID == FirebaseAuth.instance.currentUser!.uid
                      ? const Radius.circular(24)
                      : const Radius.circular(24),
              topRight: message.senderID == FirebaseAuth.instance.currentUser!.uid
                  ? Radius.circular(message.replayTextMessage != '' ||
                          message.replayImageMessage != '' ||
                          message.replayFileMessage != '' ||
                          message.replayContactMessage != ''
                      ? 0
                      : 0)
                  : const Radius.circular(30),
              bottomRight:
                  message.senderID == FirebaseAuth.instance.currentUser!.uid
                      ? const Radius.circular(0)
                      : const Radius.circular(30)),
          child: FancyShimmerImage(
            shimmerBaseColor: context.read<LoginCubit>().isDark
                ? Colors.white12
                : Colors.grey.shade300,
            shimmerHighlightColor: context.read<LoginCubit>().isDark
                ? Colors.white24
                : Colors.grey.shade100,
            boxFit: BoxFit.cover,
            imageUrl: message.messageImage!
          )
          // CachedNetworkImage(
          //   imageUrl: message.messageImage!,
          //   fit: BoxFit.cover,
          //   placeholder: (context, url) => Center(
          //       child: CircularProgressIndicator(
          //           color: message.messageText == ''
          //               ? kPrimaryColor
          //               : Colors.white)),
          //   errorWidget: (context, url, error) => const Icon(Icons.error),
          // ),
          ),
    );
  }
}
