import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/auth/login/login_cubit.dart';

class MyFriendItems extends StatelessWidget {
  const MyFriendItems(
      {super.key,
      required this.text,
      required this.textButton,
      required this.onTap});
  final String text;
  final String textButton;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.black, fontSize: 17)),
          GestureDetector(
            onTap: onTap,
            child: Text(
              textButton,
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w100,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
