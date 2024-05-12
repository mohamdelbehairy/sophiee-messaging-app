import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_one/card_one_profile_image.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_one/card_one_sub_title.dart';
import 'package:sophiee/widgets/profile_page/profile_page_card_one/card_one_title.dart';

class ProfileInfoCardOne extends StatelessWidget {
  const ProfileInfoCardOne(
      {super.key, required this.user, required this.size});
  final UserModel user;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;

    return Padding(
        padding: EdgeInsets.only(top: size.width * .02),
        child: ListTile(
            horizontalTitleGap: size.width * .03,
            leading:
                CardOneProfileImage(size: size, isDark: isDark, user: user),
            title: CardOneTitle(user: user, size: size,isDark: isDark),
            subtitle: user.nickName.isNotEmpty
                ? CardOneSubTitle(user: user, size: size)
                : const SizedBox()));
  }
}
