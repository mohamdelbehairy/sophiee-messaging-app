import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';
import '../../../cubit/auth/login/login_cubit.dart';
import 'custom_bottom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.index, this.onTap});

  final int index;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              canvasColor: context.read<LoginCubit>().isDark
                  ? cardDarkModeBackground
                  : cardLightModeBackground),
          child: SizedBox(
            height: 70,
            child: BottomNavigationBar(
                elevation: 10,
                currentIndex: index,
                onTap: onTap,
                selectedItemColor: kPrimaryColor,
                unselectedItemColor: Colors.grey,
                items: [
                  customBottomNavigationBarItem(
                      icon: Icons.person_outline_outlined,
                      activeIcon: Icons.person_rounded),
                  customBottomNavigationBarItem(
                      icon: FontAwesomeIcons.comment,
                      activeIcon: FontAwesomeIcons.solidComment),
                  customBottomNavigationBarItem(
                      icon: Icons.settings_outlined,
                      activeIcon: FontAwesomeIcons.gear),
                ]),
          ),
        );
      },
    );
  }
}
