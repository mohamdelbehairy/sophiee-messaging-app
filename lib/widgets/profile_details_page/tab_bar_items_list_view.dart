import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_details_list_tile.dart';

class TabBarItemsListTile extends StatelessWidget {
  const TabBarItemsListTile(
      {super.key,
      required this.user,
      required this.size,
      this.widget,
      this.trailingWidget});
  final UserModel user;
  final Size size;
  final Widget? widget;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final currentUser = user.userID;
          final data = state.userModel
              .firstWhere((element) => element.userID == currentUser);
          return ProfileDetailsListTile(
              size: size,
              data: data,
              isDark: isDark,
              widget: widget,
              trailingWidget: trailingWidget);
        } else {
          return Container();
        }
      },
    );
  }
}
