import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';

import '../../constants.dart';
import '../../cubit/auth/login/login_cubit.dart';
import '../../models/users_model.dart';
import 'list_view_item_online_status.dart';

class MyFriendListViewItem extends StatelessWidget {
  const MyFriendListViewItem(
      {super.key, required this.size, required this.user});

  final Size size;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    Color? color;
    return Padding(
        padding: const EdgeInsets.only(left: 16),
        child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
          builder: (context, state) {
            if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
              final friendData = state.userModel
                  .firstWhere((element) => element.userID == user.userID);
              int differenceInMinutes = Timestamp.now()
                  .toDate()
                  .difference(friendData.onlineStatue)
                  .inMinutes;
              if (differenceInMinutes < 1 && friendData.isLastSeendAndOnline) {
                color = kPrimaryColor;
              } else {
                color = Colors.grey;
              }
              return Stack(
                children: [
                  CircleAvatar(
                      radius: size.width * .065,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          CachedNetworkImageProvider(friendData.profileImage)),
                  ListViewItemOnlineStatus(size: size, isDark: isDark,color: color)
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
