import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/utils/widget/profile_page_row_see_all.dart';
import 'package:sophiee/pages/friends_page.dart';

import 'friends_list_view.dart';

class ProfilePageCardTwo extends StatelessWidget {
  const ProfilePageCardTwo({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;

    return Container(
      height: size.height * .147,
      width: size.width,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          boxShadow: [BoxShadow(blurRadius: 0, color: Colors.transparent)]),
      child: Card(
        color: isDark ? cardDarkModeBackground : cardLightModeBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.width * .02)),
        child: Column(
          children: [
            ProfilePageRowSeeAll(
                size: size,
                isDark: isDark,
                textOne: 'Friends',
                textTwo: 'See all',
                onPressed: () => Navigation.push(
                    context, FriendsPage(size: size, isDark: isDark))),
            FriendsListView(size: size),
            SizedBox(height: size.width * .034)
          ],
        ),
      ),
    );
  }
}
