import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'item_bottom_list_tile.dart';

class ItemBottom extends StatelessWidget {
  const ItemBottom({super.key, required this.user, required this.isMute});
  final UserModel user;
  final bool isMute;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    Color color;
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
          final data = state.userModel
              .firstWhere((element) => element.userID == user.userID);
          final userData = state.userModel.firstWhere((element) =>
              element.userID == FirebaseAuth.instance.currentUser!.uid);
          int differenceInMinutes =
              Timestamp.now().toDate().difference(data.onlineStatue).inMinutes;
          if (differenceInMinutes < 1 && data.isLastSeendAndOnline) {
            color = kPrimaryColor;
          } else {
            color = Colors.grey;
          }
          return ItemBottomListTile(
              userData: userData,
              data: data,
              user: user,
              isMute: isMute,
              size: size,
              isDark: isDark,
              color: color);
        } else {
          return Container();
        }
      },
    );
  }
}
