import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:sophiee/cubit/auth/auth_settings/auth_settings_cubit.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/awsome_dialog_model.dart';
import '../../utils/custom_awsome_dialog.dart';

class CustomForgetPassword extends StatelessWidget {
  const CustomForgetPassword({super.key, required this.emailAddress});
  final TextEditingController emailAddress;

  @override
  Widget build(BuildContext context) {
    var forgetPassword = context.read<AuthSettingsCubit>();
    var isDark = context.read<LoginCubit>().isDark;
    return BlocListener<AuthSettingsCubit, AuthSettingsState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          customAwsomeDialog(
              awsomeDialogModel: AwsomeDialogModel(
                  context: context,
                  autoHide: const Duration(seconds: 4),
                  horizontal: 12,
                  title: 'Password reset was successful',
                  desc: ' Please check your email and login again.',
                  dialogType: DialogType.success));
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () async {
                if (emailAddress.text.isNotEmpty) {
                  await forgetPassword.forgetPassword(email: emailAddress.text);
                }
              },
              child: Text('Forget Password?',
                  style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }
}
