import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_my_groups_body.dart';

class CustomMyGroups extends StatelessWidget {
  const CustomMyGroups({super.key, required this.groupModel});
  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 0, spreadRadius: 0, color: Colors.transparent)
      ]),
      child: CustomMyGroupsBody(
          isDark: isDark, size: size, groupModel: groupModel),
    );
  }
}

