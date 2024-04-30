import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFriendItemBio extends StatelessWidget {
  const MyFriendItemBio({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * .04, right: size.width * .002),
      child: Text(
        user.bio,
        style: TextStyle(color: isDark ? Colors.white60 : Colors.grey),
      ),
    );
  }
}
