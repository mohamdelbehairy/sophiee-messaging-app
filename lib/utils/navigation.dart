import 'package:flutter/material.dart';

class Navigation {
  static void navigationOnePop({required BuildContext context}) {
    Navigator.pop(context);
  }

  static  navigationTwoPop({required BuildContext context}) {
    Navigator.pop(context);
    Navigator.pop(context);
   
  }
}
