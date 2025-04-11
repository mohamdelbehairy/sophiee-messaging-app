import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:sophiee/cubit/auth/register/register_cubit.dart';
import 'package:sophiee/pages/create_account/add_user_data_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../constants.dart';
import '../../models/awsome_dialog_model.dart';
import '../../utils/custom_awsome_dialog.dart';
import 'register_page_bottom_sheet_body.dart';

class RegisterPageBottomSheet extends StatelessWidget {
  const RegisterPageBottomSheet({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    var isLoading = context.read<RegisterCubit>().isLoading;
    return DraggableScrollableSheet(
      initialChildSize: 0.90,
      minChildSize: 0.70,
      maxChildSize: 0.90,
      builder: (context, scrollable) => SingleChildScrollView(
        reverse: true,
        child: Container(
          decoration: BoxDecoration(
              color: isDark ? kDarkModeBackgroundColor : Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterLoading) {
                isLoading = state.isLoading;
              }
              if (state is RegisterFailure) {
                if (state.errorMessage == 'weak-password') {
                  customAwsomeDialog(
                      awsomeDialogModel: AwsomeDialogModel(
                          context: context,
                          autoHide: const Duration(seconds: 3),
                          title: 'Password is too weak',
                          desc: 'Ops, The password provided is too weak.',
                          dialogType: DialogType.error));
                } else if (state.errorMessage == 'email-already-in-use') {
                  customAwsomeDialog(
                      awsomeDialogModel: AwsomeDialogModel(
                          context: context,
                          autoHide: const Duration(seconds: 3),
                          title: 'Email already in use',
                          horizontal: 16,
                          desc:
                              'Ops, The account already exists for that email.',
                          dialogType: DialogType.error));
                }
              } else if (state is RegisterSuccess) {
                Navigation.go(context, const AddUserDataPage());
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
                  RegisterPageBottomSheetBody(
                      isLoading: isLoading, enable: isLoading),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
