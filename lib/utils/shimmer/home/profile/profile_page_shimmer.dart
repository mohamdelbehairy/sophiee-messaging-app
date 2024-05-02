import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/utils/shimmer/home/profile/custom_card_one_shimmer.dart';
import 'package:sophiee/utils/shimmer/home/profile/custom_card_three_shimmer.dart';
import 'package:sophiee/utils/shimmer/home/profile/custom_card_two_shimmer.dart';
import 'package:sophiee/widgets/profile_page/profile_page_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePageShimmer extends StatelessWidget {
  const ProfilePageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ProfilePageAppBar(size: size),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100, right: 16, left: 16),
                      child: Column(
                        children: [
                          CustomCardOneShimmer(size: size, isDark: isDark),
                          const SizedBox(height: 12),
                          CustomCardTwoShimmer(size: size, isDark: isDark),
                          const SizedBox(height: 8),
                          CustomCardThreeShimmer(size: size, isDark: isDark),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
