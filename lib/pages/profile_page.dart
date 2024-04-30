import 'package:sophiee/cubit/all_chats_shimmer_status/all_chats_shimmer_status.dart';
import 'package:sophiee/cubit/connectivity/connectivity_cubit.dart';
import 'package:sophiee/utils/shimmer/home/profile/profile_page_shimmer.dart';
import 'package:sophiee/widgets/profile_page/profile_page_body.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AllChatsShimmerStatusCubit, bool>(
        builder: (context, isLoading) {
          return BlocBuilder<ConnectivityCubit, ConnectivityResult>(
            builder: (context, state) {
              if (state == ConnectivityResult.wifi ||
                  state == ConnectivityResult.mobile) {
                return isLoading ? const ProfilePageShimmer() : const ProfilePageBody();
              } else {
                // WidgetsBinding.instance.addPostFrameCallback((_) {
                //
                //   showTopSnackBar(Overlay.of(context),
                //       snackBarPosition: SnackBarPosition.bottom,
                //       CustomSnackBar.error(message: 'Please check your internet connection and try again.'));
                // });
                return const ProfilePageShimmer();
              }
            },
          );
        },
      ),
    );
  }
}
