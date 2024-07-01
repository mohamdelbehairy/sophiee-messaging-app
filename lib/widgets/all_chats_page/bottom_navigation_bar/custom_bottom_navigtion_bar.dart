import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';
import '../../../cubit/auth/login/login_cubit.dart';
import 'custom_bottom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.index, this.onDestinationSelected});

  final int index;
  final Function(int)? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return NavigationBar(
          backgroundColor: context.read<LoginCubit>().isDark
              ? kDarkModeBackgroundColor
              : Colors.white10,
          onDestinationSelected: onDestinationSelected,
          indicatorColor: Colors.transparent,
          selectedIndex: index,
          destinations: const [
            CustomBottomNavigationBarItem(
                selectedIcon: Icons.person,
                icon: Icons.person_outline_outlined),
            CustomBottomNavigationBarItem(
                selectedIcon: FontAwesomeIcons.solidComment,
                icon: FontAwesomeIcons.comment),
            CustomBottomNavigationBarItem(
                selectedIcon: FontAwesomeIcons.gear,
                icon: Icons.settings_outlined),
          ],
        );
      },
    );
  }
}
