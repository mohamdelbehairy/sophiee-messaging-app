import 'package:sophiee/cubit/connectivity/connectivity_cubit.dart';
import 'package:sophiee/utils/shimmer/home/all_chats/chats/list_view_bottom_shimmer.dart';
import 'package:sophiee/utils/shimmer/home/all_chats/chats/list_view_top_shimmer.dart';
import 'package:sophiee/widgets/all_chats_page/list_view_bottom.dart';
import 'package:sophiee/widgets/all_chats_page/list_view_top.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllChatsBody extends StatelessWidget {
  const AllChatsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityResult>(
        builder: (context, state) {
      if (state == ConnectivityResult.wifi ||
          state == ConnectivityResult.mobile) {
        return const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: ListViewTop()),
            ListViewBottom(),
          ],
        );
      } else {
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   showTopSnackBar(Overlay.of(context),
        //       snackBarPosition: SnackBarPosition.bottom,
        //       CustomSnackBar.error(message: 'Please check your internet connection and try again.'));
        // });
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
