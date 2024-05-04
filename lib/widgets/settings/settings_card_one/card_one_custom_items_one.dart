import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/widgets/all_chats_page/groups_page/groups_chat_page/groups_permissions_page/custom_switch_icon.dart';

class CardOneCustomItemsOne extends StatelessWidget {
  const CardOneCustomItemsOne(
      {super.key,
      required this.color,
      required this.icon,
      required this.text,
      required this.iconChange,
      required this.onPressed,
      required this.size,
      required this.value,
      required this.onChanged});
  final Color color;
  final IconData icon;
  final String text;
  final IconData iconChange;
  final Function() onPressed;
  final Size size;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
                radius: size.width * .042,
                backgroundColor: color,
                child:
                    Icon(icon, color: Colors.white, size: size.width * .044)),
            SizedBox(width: size.width * .02),
            Text(
              text,
              style: TextStyle(
                  fontSize: size.width * .039,
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
        CustomSwitchIcon(
            size: size,
            onChanged: onChanged,
            value: value,
            height: size.height * .05)
        // IconButton(
        //     splashColor: Colors.transparent,
        //     highlightColor: Colors.transparent,
        //     onPressed: onPressed,
        //     icon: Icon(iconChange)),
      ],
    );
  }
}
