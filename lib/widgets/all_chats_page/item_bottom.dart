import 'package:firebase_auth/firebase_auth.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/all_chats_page/item_bottom_list_tile_sub_title.dart';
import 'package:sophiee/widgets/all_chats_page/item_bottom_list_tile_title.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          final currentUser = user.userID;
          final data = state.userModel
              .firstWhere((element) => element.userID == currentUser);
          final userData = state.userModel.firstWhere((element) =>
              element.userID == FirebaseAuth.instance.currentUser!.uid);
          int differenceInMinutes =
              Timestamp.now().toDate().difference(data.onlineStatue).inMinutes;
          if (differenceInMinutes < 1 && data.isLastSeendAndOnline) {
            color = kPrimaryColor;
          } else {
            color = Colors.grey;
          }
          return ListTile(
              title: ItemBottomListTileTitle(
                  userData: userData, data: data, user: user, isMute: isMute),
              leading: Stack(
                children: [
                  CircleAvatar(
                      radius: size.height * .03,
                      backgroundColor: Colors.transparent,
                      child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(size.height * .034),
                          child: FancyShimmerImage(
                              boxFit: BoxFit.cover,
                              shimmerBaseColor: isDark
                                  ? Colors.white12
                                  : Colors.grey.shade300,
                              shimmerHighlightColor: isDark
                                  ? Colors.white24
                                  : Colors.grey.shade100,
                              imageUrl: !data.isProfilePhotos
                                  ? defaultProfileImageUrl
                                  : data.profileImage))),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: CircleAvatar(
                        radius: size.width * .02,
                        backgroundColor: isDark
                            ? cardDarkModeBackground
                            : const Color(0xfff1f2f2),
                        child: CircleAvatar(
                            backgroundColor: color, radius: size.width * .015)),
                  )
                ],
              ),
              subtitle: ItemBottomSubTitleListTile(user: user, data: data));
        } else {
          return Container();
        }
      },
    );
  }
}
