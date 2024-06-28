import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:sophiee/cubit/auth/auth_settings/auth_settings_cubit.dart';
import 'package:sophiee/utils/widget/custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/awsome_dialog_model.dart';
import '../../utils/custom_awsome_dialog.dart';

class VerificationPageCustomButton extends StatelessWidget {
  const VerificationPageCustomButton(
      {super.key, required this.size, required this.isDark});

  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthSettingsCubit, AuthSettingsState>(
        listener: (context, state) {
          if (state is VerificationEmailSuccess) {
            customAwsomeDialog(
              awsomeDialogModel: AwsomeDialogModel(
                  context: context,
                  autoHide: const Duration(seconds: 4),
                  horizontal: 12,
                  title: 'Verification email sent',
                  desc:
                      'Verification link sent successful, Please check your email.',
                  dialogType: DialogType.success));
          }
        },
        child: CustomBottom(
            width: size.width * .55,
            borderRadius: BorderRadius.circular(size.width * .01),
            text: 'Resend Verification Email',
            colorBottom: isDark ? Colors.white : const Color(0xff3a4352),
            colorText: isDark ? const Color(0xff3a4352) : Colors.white,
            onPressed: () async {
              await context.read<AuthSettingsCubit>().verificationEmail();
            }));
  }
}
