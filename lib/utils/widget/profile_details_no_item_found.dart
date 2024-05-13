import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';

class ProfileDetailsNoItemFound extends StatelessWidget {
  const ProfileDetailsNoItemFound(
      {super.key,
      required this.size,
      required this.textOne,
      required this.textTwo,
      this.textThree,
      this.onTap});

  final Size size;
  final String textOne;
  final String textTwo;
  final String? textThree;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Image.asset(emptyImageUrl, fit: BoxFit.cover, height: size.height * .25)),
          ],
        ),
        Text(textOne,
            style: TextStyle(color: isDark ? Colors.white: Colors.black, fontSize: size.height * .045)),
        SizedBox(height: size.width * .01),
        Text(textTwo,
            textAlign: TextAlign.center,
            style: TextStyle(color: isDark ? Colors.white54: Colors.grey, fontSize: size.width * .03)),
        SizedBox(height: size.width * .035),
        if (textThree != null)
          GestureDetector(
              onTap: onTap,
              child: Text(textThree!,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: size.width * .035,
                      fontWeight: FontWeight.w800)))
      ],
    );
  }
}
