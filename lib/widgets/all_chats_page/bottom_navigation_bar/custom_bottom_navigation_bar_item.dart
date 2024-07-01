import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem(
      {super.key, required this.selectedIcon, required this.icon});
  final IconData selectedIcon, icon;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
        selectedIcon: Icon(selectedIcon, color: kPrimaryColor),
        icon: Icon(icon),
        label: '');
  }
}
