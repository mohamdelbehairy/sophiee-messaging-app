import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/copy_text/copy_text_cubit.dart';
import 'package:sophiee/cubit/get_followers/get_followers_cubit.dart';
import 'package:sophiee/cubit/get_following/get_following_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/utils/widget/flutter_toast_widget.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_one/profile_info_card_one.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_one/profile_page_card_one_bio.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_one/profile_page_card_one_divider.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_one/profile_page_card_one_profile_details.dart';

class ProfilePageCardOneBodyComponent extends StatelessWidget {
  const ProfilePageCardOneBodyComponent(
      {super.key,
      required this.size,
      required this.isDark,
      required this.user,
      required this.follower,
      required this.following});

  final Size size;
  final bool isDark;
  final UserModel user;
  final GetFollowersCubit follower;
  final GetFollowingCubit following;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .38,
      width: size.width,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          boxShadow: [BoxShadow(blurRadius: 0, color: Colors.transparent)]),
      child: Card(
        color: isDark ? cardDarkModeBackground : cardLightModeBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.width * .02)),
        child: BlocListener<CopyTextCubit, CopyTextState>(
          listener: (context, state) {
            if (state is CopyTextSuccess) {
              FlutterToastWidget.showToast(msg: "Copied");
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileInfoCardOne(user: user, size: size, isDark: isDark),
              ProfilePageCardOneDivider(size: size),
              ProfilePageCardOneBio(size: size, user: user, isDark: isDark),
              SizedBox(height: size.height * .01),
              ProfilePageCardOneProfileDetails(
                  size: size,
                  isDark: isDark,
                  user: user,
                  follower: follower,
                  following: following)
            ],
          ),
        ),
      ),
    );
  }
}
