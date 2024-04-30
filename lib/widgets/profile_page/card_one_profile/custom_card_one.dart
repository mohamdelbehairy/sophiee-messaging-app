import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/get_followers/get_followers_cubit.dart';
import 'package:sophiee/cubit/get_followers/get_followers_state.dart';
import 'package:sophiee/cubit/get_following/get_following_cubit.dart';
import 'package:sophiee/cubit/get_following/get_following_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/profile_details_page/profile_details_page.dart';
import 'package:sophiee/widgets/profile_page/card_one_profile/custom_profile_info.dart';
import 'package:sophiee/widgets/profile_page/card_one_profile/name_photo_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class CustomProfileCardOne extends StatelessWidget {
  const CustomProfileCardOne(
      {super.key, required this.onTap, required this.user});

  final Function() onTap;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = context.read<LoginCubit>().isDark;
    var follower = context.read<GetFollowersCubit>();
    var following = context.read<GetFollowingCubit>();
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 8, left: 16),
      child: Container(
        height: MediaQuery.of(context).size.height * .4,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              blurRadius: 40,
              color: isDark
                  ? Colors.grey.withOpacity(.01)
                  : Colors.grey.withOpacity(.4),
            ),
          ],
        ),
        child: Card(
          color: isDark ? const Color(0xff2b2c33) : Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomNamePhotoProfile(user: user, onTap: onTap),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade200,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    user.bio,
                    style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: size.height * .02),
                  ),
                ),
              ),
              // SizedBox(height: MediaQuery.of(context).size.height * .12),
              SizedBox(
                  height: user.bio.length <= 111 && user.bio.length >= 109
                      ? MediaQuery.of(context).size.height * .02
                      : user.bio.length <= 108 && user.bio.length > 72
                          ? MediaQuery.of(context).size.height * .05
                          : user.bio.length <= 72 && user.bio.length > 36
                              ? MediaQuery.of(context).size.height * .08
                              : MediaQuery.of(context).size.height * .09),
              Expanded(
                child: Container(
                  // height: MediaQuery.of(context).size.height * .1,
                  color: Colors.grey.withOpacity(.06),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CustomProfileInfo(
                            numberInfo: '532', textInfo: 'Public Post'),
                        BlocBuilder<GetFollowersCubit, GetFollowersState>(
                          builder: (context, state) {
                            if (state is GetFollowersSuccess) {
                              return GestureDetector(
                                onTap: () {
                                  getnav.Get.to(
                                      () => ProfileDetailsPage(
                                          index: 0, user: user),
                                      transition:
                                          getnav.Transition.leftToRight);
                                },
                                child: CustomProfileInfo(
                                    numberInfo:
                                        '${follower.followersList.length}',
                                    textInfo: 'Followers'),
                              );
                            } else {
                              return const CustomProfileInfo(
                                  numberInfo: '0', textInfo: 'Followers');
                            }
                          },
                        ),
                        BlocBuilder<GetFollowingCubit, GetFollowingState>(
                          builder: (context, state) {
                            if (state is GetFollowingSuccess) {
                              return GestureDetector(
                                onTap: () {
                                  getnav.Get.to(
                                      () => ProfileDetailsPage(
                                          index: 1, user: user),
                                      transition:
                                          getnav.Transition.leftToRight);
                                },
                                child: CustomProfileInfo(
                                  numberInfo:
                                      '${following.followingList.length}',
                                  textInfo: 'Following',
                                ),
                              );
                            } else {
                              return const CustomProfileInfo(
                                numberInfo: '0',
                                textInfo: 'Following',
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
