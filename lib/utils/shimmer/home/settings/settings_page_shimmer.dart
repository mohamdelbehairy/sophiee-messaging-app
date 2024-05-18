import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/utils/shimmer/home/settings/settings_page_card_one_shimmer.dart';
import 'package:sophiee/utils/shimmer/home/settings/settings_page_card_two_shimmer.dart';
import 'package:sophiee/widgets/settings/settings_page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPageShimmer extends StatelessWidget {
  const SettingsPageShimmer({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return Column(
      children: [
        SettingsPageAppBar(size: size,appParTitle: 'Setting'),
        SettingsPageCardOneShimmer(isDark: isDark,size: size),
        SettingsPageCardTwoShimmer(isDark: isDark,size: size),
      ],
    );
  }
}
