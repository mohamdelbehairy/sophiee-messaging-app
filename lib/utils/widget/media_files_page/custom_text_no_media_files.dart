import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/auth/login/login_cubit.dart';

class CustomTextNoMediaFiles extends StatelessWidget {
  const CustomTextNoMediaFiles(
      {super.key, required this.size, required this.text});

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
        var isDark = context.read<LoginCubit>().isDark;
    return Center(
        child: Text(text,
            style:
                TextStyle(color: isDark ? Colors.white: Colors.black, fontSize: size.height * .02)));
  }
}
