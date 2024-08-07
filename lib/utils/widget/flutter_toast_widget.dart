import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sophiee/constants.dart';

class FlutterToastWidget {
  static void showToast({required String msg}) {
    Fluttertoast.showToast(
        msg: msg,
        fontSize: 14,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        backgroundColor: kPrimaryColor);
  }

  static void cancleShowToast() {
    Fluttertoast.cancel();
  }
}
