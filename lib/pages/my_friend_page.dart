import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/follow_status/follow_status_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';

import '../widgets/my_friend_page/my_friend_page_body.dart';

class MyFriendPage extends StatelessWidget {
  const MyFriendPage({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    context
        .read<FollowStatusCubit>()
        .checkFollowStatus(followerID: user.userID);
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
            builder: (context, state) {
              if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
                final userData = state.userModel
                    .firstWhere((element) => element.userID == user.userID);
                return MyFriendPageBody(user: userData, size: size);
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
