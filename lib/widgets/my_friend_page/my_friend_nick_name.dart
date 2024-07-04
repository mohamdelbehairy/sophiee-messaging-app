import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/copy_text/copy_text_cubit.dart';

import '../../models/users_model.dart';

class MyFriendNickName extends StatelessWidget {
  const MyFriendNickName({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () =>
            context.read<CopyTextCubit>().copyText(text: user.nickName),
        child: Text(user.nickName, style: const TextStyle(color: Colors.blue)));
  }
}
