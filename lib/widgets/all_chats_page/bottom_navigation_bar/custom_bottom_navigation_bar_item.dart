import 'package:flutter/material.dart';

BottomNavigationBarItem customBottomNavigationBarItem(
    {required IconData icon, required IconData activeIcon}) {
  return BottomNavigationBarItem(
    label: '',
    icon: Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Icon(icon),
    ),
    activeIcon: Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Icon(activeIcon),
    ),
  );
}
