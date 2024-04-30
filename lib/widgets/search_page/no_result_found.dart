import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNoResultFound extends StatelessWidget {
  const CustomNoResultFound({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: size.height * .25,
          width: size.width * .8,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/empty.png'),
            ),
          ),
        ),
        SizedBox(height: size.height * .02),
        Text(
          'No Result Found',
          style: TextStyle(
              color: isDark ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: size.height * .03),
        ),
        SizedBox(height: size.height * .01),
        Text(
          "You didn't  find any results with this name yet,",
          style: TextStyle(
              color: isDark ? Colors.white60 : Colors.grey,
              fontSize: size.width * .032),
        ),
        Text(
          'please enter a sucess username or email.',
          style: TextStyle(
              color: isDark ? Colors.white60 : Colors.grey,
              fontSize: size.width * .032),
        ),
      ],
    );
  }
}
