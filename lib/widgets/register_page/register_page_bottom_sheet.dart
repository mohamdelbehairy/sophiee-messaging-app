import 'package:sophiee/cubit/auth/register/register_cubit.dart';
import 'package:sophiee/pages/create_account/add_user_data_page.dart';
import 'package:sophiee/utils/widget/show_top_snack_bar/show_top_snack_bar_failure.dart';
import 'package:sophiee/widgets/register_page/register_page_bottom_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

import '../../constants.dart';

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
                  showTopSnackBarFailure(
                      context: context,
                      message: 'Ops, The password provided is too weak.');
                } else if (state.errorMessage == 'email-already-in-use') {
                  showTopSnackBarFailure(
                      context: context,
                      message:
                          'Ops, The account already exists for that email.');
                }
              } else if (state is RegisterSuccess) {
                getnav.Get.to(() => const AddUserDataPage(),
                    transition: getnav.Transition.rightToLeft);
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(
                      width: 40,
                      child: Divider(
                          thickness: 5,
                          color: isDark ? messageFriendColorDarkMode: Colors.grey)),
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
