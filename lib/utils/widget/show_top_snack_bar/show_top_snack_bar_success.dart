import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showTopSnackBarSuccess(
    {required BuildContext context, required String message}) {
  return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
          boxShadow: const [BoxShadow(color: Colors.transparent)], message: message));
}
