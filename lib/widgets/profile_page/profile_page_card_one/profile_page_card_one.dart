import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/get_followers/get_followers_cubit.dart';
import 'package:sophiee/cubit/get_followers/get_followers_state.dart';
import 'package:sophiee/cubit/get_following/get_following_cubit.dart';
import 'package:sophiee/cubit/get_following/get_following_state.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/profile_details_page/profile_details_page.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_one/custom_profile_info.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_one/profile_info_card_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;
import 'package:sophiee/widgets/profile_page/profile_page_card_one/profile_page_card_one_divider.dart';

class ProfilePageCardOne extends StatelessWidget {
  const ProfilePageCardOne(
      {super.key, required this.onTap, required this.user, required this.size});

  final Function() onTap;
  final UserModel user;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    var follower = context.read<GetFollowersCubit>();
    var following = context.read<GetFollowingCubit>();

    return Padding(
      padding: EdgeInsets.only(
          right: size.width * .035,
          top: size.width * .02,
          left: size.width * .035),
      child: Container(
        height: size.height * .4,
        width: size.width,
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
              borderRadius: BorderRadius.circular(size.width * .02)),
          child: Column(
            children: [
              ProfileInfoCardOne(user: user, onTap: onTap, size: size),
              ProfilePageCardOneDivider(size: size),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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

