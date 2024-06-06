import 'package:sophiee/cubit/connectivity/connectivity_cubit.dart';
import 'package:sophiee/cubit/get_friends/get_friends_cubit.dart';
import 'package:sophiee/utils/shimmer/home/all_chats/chats/list_view_bottom_shimmer.dart';
import 'package:sophiee/utils/shimmer/home/all_chats/chats/list_view_top_shimmer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/auth/login/login_cubit.dart';
import '../../cubit/chats/chats_cubit.dart';
import 'all_chats_component.dart';

class AllChatsBody extends StatelessWidget {
  const AllChatsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var friends = context.read<GetFriendsCubit>();
    var chat = context.read<ChatsCubit>();
    var size = MediaQuery.sizeOf(context);
    var isDark = context.read<LoginCubit>().isDark;
    return BlocBuilder<ConnectivityCubit, ConnectivityResult>(
        builder: (context, state) {
      if (state == ConnectivityResult.wifi ||
          state == ConnectivityResult.mobile) {
        return AllChatsComponent(
            friends: friends, chat: chat, size: size, isDark: isDark);
      } else {
        return const SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(children: [
            ListViewTopShimmer(),
            ListViewBottomShimmer(),
          ]),
        );
      }
    });
  }
}
