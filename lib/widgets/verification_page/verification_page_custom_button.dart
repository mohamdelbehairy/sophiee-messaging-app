import 'package:sophiee/cubit/auth/auth_settings/auth_settings_cubit.dart';
import 'package:sophiee/utils/widget/show_top_snack_bar/show_top_snack_bar_success.dart';
import 'package:sophiee/utils/widget/custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            showTopSnackBarSuccess(
                context: context,
                message:
                    'Verification link sent successful, Please check your email.');
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
