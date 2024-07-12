import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'result_item_leading.dart';
import 'result_item_title.dart';

class ResultIem extends StatelessWidget {
  const ResultIem({super.key, required this.user, required this.userData});
  final UserModel user,userData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;

    return ListTile(
        title: ResultItemTitle(size: size, user: user, isDark: isDark,userData: userData),
        leading: ResultItemLeading(isDark: isDark, user: user,userData: userData));
  }
}

