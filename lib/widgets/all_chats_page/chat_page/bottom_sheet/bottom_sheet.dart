import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/bottom_sheet/bottom_icons_bottom_sheet.dart';
import 'package:sophiee/widgets/all_chats_page/chat_page/bottom_sheet/top_icons_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBottomSheet extends StatelessWidget {
  const ChatBottomSheet(
      {super.key,
      required this.user,
      required this.replayTextMessageImage,
      required this.replayImageMessageImage,
      required this.replayFileMessageImage,
      required this.replayContactMessageContact,
      required this.replayFileMessage});
  final UserModel user;
  final String replayTextMessageImage;
  final String replayImageMessageImage;
  final String replayFileMessageImage;
  final String replayContactMessageContact;
  final String replayFileMessage;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .3,
      width: size.width * .9,
      child: Card(
        color: isDark ? Colors.black87 : Colors.white,
        margin: EdgeInsets.all(size.width * .065),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.width * .04),
          child: Column(
            children: [
              TopIconsBottomSheet(
                  user: user,
                  replayTextMessageImage: replayTextMessageImage,
                  replayImageMessageImage: replayImageMessageImage,
                  replayFileMessageImage: replayFileMessageImage,
                  replayFileMessage: replayFileMessage,
                  replayContactMessageContact: replayContactMessageContact),
              SizedBox(height: size.height * .01),
              const BottomIconsBottomSheet(),
            ],
          ),
        ),
      ),
    );
  }
}
