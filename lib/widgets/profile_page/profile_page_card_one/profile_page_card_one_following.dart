import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/get_following/get_following_cubit.dart';
import 'package:sophiee/cubit/get_following/get_following_state.dart';
import 'package:sophiee/pages/profile_details_page/following_page.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_one/custom_profile_info.dart';
import 'package:get/get.dart' as getnav;

class ProfilePageCardOneFollowing extends StatelessWidget {
  const ProfilePageCardOneFollowing(
      {super.key, required this.user, required this.following, required this.size});

  final UserModel user;
  final GetFollowingCubit following;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => getnav.Get.to(() => FollowingPage(size: size),
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
