import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_details_list_tile.dart';

class ListViewListTile extends StatelessWidget {
  const ListViewListTile(
      {super.key,
      required this.friendData,
      required this.size,
      this.widget,
      this.trailingWidget});
  final UserModel friendData;
  final Size size;
  final Widget? widget;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return ProfileDetailsListTile(
        size: size,
        friendData: friendData,
        isDark: isDark,
        widget: widget,
        trailingWidget: trailingWidget);
  }
}
