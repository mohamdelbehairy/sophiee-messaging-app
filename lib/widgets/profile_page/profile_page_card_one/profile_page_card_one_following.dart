import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/get_following/get_following_cubit.dart';
import 'package:sophiee/cubit/get_following/get_following_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/profile_details_page/profile_details_page.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_one/custom_profile_info.dart';
import 'package:get/get.dart' as getnav;

class ProfilePageCardOneFollowing extends StatelessWidget {
  const ProfilePageCardOneFollowing(
      {super.key, required this.user, required this.following});

  final UserModel user;
  final GetFollowingCubit following;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => getnav.Get.to(() => ProfileDetailsPage(index: 1, user: user),
          transition: getnav.Transition.rightToLeft),
      child: BlocBuilder<GetFollowingCubit, GetFollowingState>(
        builder: (context, state) {
          if (state is GetFollowingSuccess) {
            return CustomProfileInfo(
                numberInfo: '${following.followingList.length}',
                textInfo: 'Following');
          } else {
            return const CustomProfileInfo(
              numberInfo: '0',
              textInfo: 'Following',
            );
          }
        },
      ),
    );
  }
}
