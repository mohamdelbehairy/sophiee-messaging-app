import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsPageItemOne extends StatelessWidget {
  const FriendsPageItemOne({super.key, required this.friendsNumber});
  final int friendsNumber;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return Container(
      height: size.height * .05,
      decoration: BoxDecoration(
        color: context.read<LoginCubit>().isDark
            ? Colors.grey.withOpacity(.08)
            : Colors.grey.withOpacity(.09),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: size.width * .03),
        child: Row(
          children: [
            Text(
              '$friendsNumber',
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: size.height * .02,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(width: size.width * .01),
            Text(
              'Friends',
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: size.height * .02,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
