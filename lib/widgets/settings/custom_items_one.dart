import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomItemsOne extends StatelessWidget {
  const CustomItemsOne(
      {super.key,
      required this.color,
      required this.icon,
      required this.text,
      required this.iconChange,
      required this.onPressed});
  final Color color;
  final IconData icon;
  final String text;
  final IconData iconChange;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: color,
              child: Icon(
                icon,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  color: context.read<LoginCubit>().isDark
                      ? Colors.white
                      : Colors.black),
            ),
          ],
        ),
        // Transform.scale(
        //   scaleX: .7,
        //   scaleY: .9,
        //   child: GFToggle(
        //     duration: Duration(milliseconds: 400),
        //     onChanged: (val) {
        //       if (val == true) {
        //         print('object');
        //       }
        //     },
        //     value: true,
        //     type: GFToggleType.ios,
        //     enabledTrackColor: kPrimaryColor,
        //     disabledTrackColor: Colors.grey.withOpacity(.2),
        //   ),
        // ),
        // Transform.scale(
        //   scale: .8,
        //   child: Switch(
        //     activeTrackColor: kPrimaryColor,
        //     inactiveTrackColor: Colors.grey.withOpacity(.6),
        //     inactiveThumbColor: Colors.white,
        //     value: isSwitched,
        //     onChanged: onChanged,
        //   ),
        // ),
        IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: onPressed,
          icon: Icon(iconChange),
        ),
      ],
    );
  }
}
