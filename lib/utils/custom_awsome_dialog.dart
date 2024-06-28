import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../models/awsome_dialog_model.dart';

Future customAwsomeDialog({required AwsomeDialogModel awsomeDialogModel}) {
  return AwesomeDialog(
          context: awsomeDialogModel.context,
          dialogType: awsomeDialogModel.dialogType,
          animType: awsomeDialogModel.animType,
          title: awsomeDialogModel.title,
          descTextStyle: const TextStyle(color: Colors.black),
          desc: awsomeDialogModel.desc,
          padding: EdgeInsets.symmetric(
              horizontal: awsomeDialogModel.horizontal ?? 0.0),
          autoHide: awsomeDialogModel.autoHide,
          showCloseIcon: awsomeDialogModel.showCloseIcon,
          btnOkOnPress: awsomeDialogModel.btnOkOnPress,
          btnCancelOnPress: awsomeDialogModel.btnCancelOnPress,
          btnOkText: awsomeDialogModel.btnOkText,
          btnCancelText: awsomeDialogModel.btnCancelText)
      .show();
}
