import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPageFriendInfoBottomSheet extends StatelessWidget {
  const ChatPageFriendInfoBottomSheet(
      {super.key,
      required this.text,
      this.textInfo,
      required this.iconColor,
      required this.icon,
      required this.onTap});
  final String text;
  final String? textInfo;
  final Color iconColor;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .04),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text,
                    style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: size.width * .035)),
                if (textInfo != null)
                  Text(textInfo!,
                      style: TextStyle(
                          color: isDark ? Colors.white54 : Colors.grey,
                          fontSize: size.width * .03))
              ],
            ),
            CircleAvatar(
                radius: size.height * .018,
                backgroundColor: iconColor,
                child:
                    Icon(icon, color: Colors.white, size: size.height * .018))
          ],
        ),
      ),
    );
  }
}
