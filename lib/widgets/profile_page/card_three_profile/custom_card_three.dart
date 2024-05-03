import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProfileCardThree extends StatelessWidget {
  const CustomProfileCardThree({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    final size = MediaQuery.of(context).size;

    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Colors.transparent, boxShadow: [
        BoxShadow(
          blurRadius: 0,
          color: Colors.transparent,
        ),
      ]),
      child: Card(
        color: isDark ? const Color(0xff2b2c28) : Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Photos',
                    style: TextStyle(
                        color: isDark ? Colors.white : Colors.black87,
                        fontSize: size.height * .02),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See all',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
