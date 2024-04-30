import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPageFriendDetails extends StatelessWidget {
  const ChatPageFriendDetails(
      {super.key, required this.textNumber, required this.textType});
  final String textNumber;
  final String textType;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    return Column(
      children: [
        Text(
          textNumber,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        Text(
          textType,
          style: TextStyle(
            color: isDark ? Colors.white54 : Colors.grey,
          ),
        )
      ],
    );
  }
}
