import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_create_group_body.dart';

class CustomCreateGroup extends StatelessWidget {
  const CustomCreateGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 0, spreadRadius: 0, color: Colors.transparent)
      ]),
      child: CustomCreateGroupBody(isDark: isDark),
    );
  }
}
