import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/copy_text/copy_text_cubit.dart';
import 'package:sophiee/models/users_model.dart';

class ProfilePageCardOneBio extends StatelessWidget {
  const ProfilePageCardOneBio(
      {super.key,
      required this.size,
      required this.user,
      required this.isDark});

  final Size size;
  final UserModel user;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .04, vertical: size.width * .02),
            child: GestureDetector(
              onLongPress: () =>
                  context.read<CopyTextCubit>().copyText(text: user.bio),
              child: Text(user.bio,
                  style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: size.height * .016)),
            )));
  }
}
