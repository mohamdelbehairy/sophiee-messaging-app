import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/user_date/user_token/user_token_cubit.dart';
import 'package:sophiee/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../constants.dart';
import '../../models/awsome_dialog_model.dart';
import '../../pages/create_account/verificaton_page.dart';
import '../../utils/custom_awsome_dialog.dart';
import 'login_page_botom_sheet_details.dart';

class LoginPageBottomSheet extends StatelessWidget {
  const LoginPageBottomSheet({super.key, required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    var token = context.read<UserTokenCubit>();
    var isLoading = context.read<LoginCubit>().isLoading;
    return DraggableScrollableSheet(
      initialChildSize: 0.88,
      minChildSize: 0.75,
      maxChildSize: 0.88,
      builder: (context, controller) => SingleChildScrollView(
        reverse: true,
        child: Container(
          decoration: BoxDecoration(
              color: isDark ? kDarkModeBackgroundColor : Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) async {
              if (state is LoginLoading) {
                isLoading = state.isLoading;
              }
              if (state is LoginFailure &&
                  state.errorMessage == 'invalid-credential') {
                customAwsomeDialog(
                    awsomeDialogModel: AwsomeDialogModel(
                        context: context,
                        autoHide: const Duration(seconds: 4),
                        horizontal: 16,
                        title: 'Login Failed',
                        desc:
                            'Opps, There was a problem logging in. Check your email and password or create an account.',
                        dialogType: DialogType.error));
              } else if (state is LoginSuccess) {
                if (FirebaseAuth.instance.currentUser!.emailVerified) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false);
                  String? getToken = await token.getUserToken();
                  await token.updateUserToken(token: getToken);
                } else {
                  customAwsomeDialog(
                      awsomeDialogModel: AwsomeDialogModel(
                          context: context,
                          showCloseIcon: true,
                          title: 'Email is not verified',
                          desc: 'Please verified you email and login again.',
                          dialogType: DialogType.error,
                          btnCancelText: 'Verified now',
                          btnCancelOnPress: () => Navigation.push(
                              context, const VerificationPage())));
                }
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(
                      width: 40,
                      child: Divider(
                          thickness: 5,
                          color: isDark
                              ? messageFriendColorDarkMode
                              : Colors.grey)),
                  LoginPageBottomSheetBody(
                      isDark: isDark, isLoading: isLoading),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
