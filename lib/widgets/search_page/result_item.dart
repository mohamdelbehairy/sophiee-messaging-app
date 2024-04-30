import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultIem extends StatelessWidget {
  const ResultIem({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;

    return ListTile(
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: size.width * .03),
            child: Text(
              user.userName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
            ),
          ),
          Expanded(
            child: Text(user.nickName,
                style: TextStyle(
                  color: isDark ? Colors.white60 : Colors.grey,
                  fontSize: size.width * .032,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.profileImage),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

