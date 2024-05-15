import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardOneCustomItemsOne extends StatelessWidget {
  const CardOneCustomItemsOne(
      {super.key,
      required this.color,
      required this.icon,
      required this.text,
      required this.iconChange,
      required this.onPressed,
      required this.size});
  final Color color;
  final IconData icon;
  final String text;
  final IconData iconChange;
  final Function() onPressed;
  final Size size;

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
            const SizedBox(width: 8),
            Text(text,
                style: TextStyle(
                    fontSize: size.width * .039,
                    color: context.read<LoginCubit>().isDark
                        ? Colors.white
                        : Colors.black))
          ],
        ),
        // Icon(iconChange)
        IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: onPressed,
            icon: Icon(iconChange)),
      ],
    );
  }
}
