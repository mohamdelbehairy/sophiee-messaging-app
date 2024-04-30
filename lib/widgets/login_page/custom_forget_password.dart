import 'package:sophiee/cubit/auth/auth_settings/auth_settings_cubit.dart';
import 'package:sophiee/utils/widget/show_top_snack_bar/show_top_snack_bar_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForgetPassword extends StatelessWidget {
  const CustomForgetPassword({super.key, required this.emailAddress});
  final TextEditingController emailAddress;

  @override
  Widget build(BuildContext context) {
    var forgetPassword = context.read<AuthSettingsCubit>();
    return BlocListener<AuthSettingsCubit, AuthSettingsState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          showTopSnackBarSuccess(
              context: context,
              message:
                  "Password reset was successful, Please check your email and login again.");
          // WidgetsBinding.instance.addPostFrameCallback((_) {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       backgroundColor: Colors.transparent,
          //       content: SnackBarWidget(
          //           title: 'Password reset was successful',
          //           icon: Icons.check_circle,
          //           color: Colors.green,
          //           message: 'Please check your email and login again.')));
          // });
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () async {
                await forgetPassword.forgetPassword(email: emailAddress.text);
              },
              child: const Text('Forget Password?',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }
}
