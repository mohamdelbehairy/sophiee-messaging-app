import 'package:flutter/material.dart';

abstract class Navigation {
  static void push(BuildContext context, Widget view) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => view));
  }

  static void go(BuildContext context, Widget view) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => view), (route) => false);
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  // static doublePop({required BuildContext context}) {
  //   Navigator.pop(context);
  //   Navigator.pop(context);
  // }
}
