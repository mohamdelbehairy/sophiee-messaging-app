import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/copy_text/copy_text_cubit.dart';
import 'package:sophiee/models/users_model.dart';

class CardOneSubTitle extends StatelessWidget {
  const CardOneSubTitle(
      {super.key,
      required this.user,
      required this.size,
      required this.isDark});

  final UserModel user;
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () =>
            context.read<CopyTextCubit>().copyText(text: user.nickName),
        child: Text(user.nickName,
            style: TextStyle(
                color: isDark ? Colors.white60 : Colors.grey,
                fontSize: size.width * .03)));
  }
}
