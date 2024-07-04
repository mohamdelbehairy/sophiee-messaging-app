import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/copy_text/copy_text_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyFriendItemBio extends StatelessWidget {
  const MyFriendItemBio({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;

    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 2, top: 2),
        child: GestureDetector(
          onLongPress: () =>
              context.read<CopyTextCubit>().copyText(text: user.bio),
          child: Text(user.bio.isNotEmpty ? user.bio : 'no bio here yet',
              style: TextStyle(color: isDark ? Colors.white60 : Colors.grey)),
        ));
  }
}
