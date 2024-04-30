import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProfileInfo extends StatelessWidget {
  const CustomProfileInfo(
      {super.key, required this.numberInfo, required this.textInfo});
  final String numberInfo;
  final String textInfo;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        // SizedBox(height: size.height * .025),
        Text(
          numberInfo,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: size.width * .042,
          ),
        ),
        SizedBox(height: size.height * .009),
        Text(
          textInfo,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: size.width * .032,
          ),
        ),
      ],
    );
  }
}
