import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/auth/register/register_cubit.dart';
import 'package:sophiee/utils/widget/auth/auth_bottom_sheet_top_text.dart';
import 'package:sophiee/utils/widget/auth/text_field_confirm_password.dart';
import 'package:sophiee/utils/widget/custom_bottom.dart';
import 'package:sophiee/utils/widget/auth/text_field_email.dart';
import 'package:sophiee/utils/widget/auth/text_field_password.dart';
import 'package:sophiee/widgets/register_page/custom_text_bottom_sheet_read_and_agree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPageBottomSheetBody extends StatefulWidget {
  const RegisterPageBottomSheetBody({super.key, required this.isLoading});
  final bool isLoading;

  @override
  State<RegisterPageBottomSheetBody> createState() =>
      _RegisterPageBottomSheetBodyState();
}

class _RegisterPageBottomSheetBodyState
    extends State<RegisterPageBottomSheetBody> {
  GlobalKey<FormState> globalKey = GlobalKey();
  bool isPressed = false;
  bool isActive = false;
  TextEditingController userName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var register = context.read<RegisterCubit>();
    final isDark = context.read<LoginCubit>().isDark;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 32, left: 32, top: 12),
        child: Form(
          key: globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthBottomSheetTopText(isDark: isDark, text: 'Signup'),
              const SizedBox(height: 16),
              TextFieldEmail(emailAddress: emailAddress),
              const SizedBox(height: 8),
              TextFieldPassword(password: password),
              const SizedBox(height: 8),
              TextFieldConfirmPassword(
                  confirmPassword: confirmPassword, password: password),
              CustomTextBottomSheetReadAndAgree(
                  onTap: () {
                    setState(() {
                      isPressed = !isPressed;
                      isActive = isPressed;
                    });
                  },
                  isPressed: isPressed,
                  isDark: isDark),
              const SizedBox(height: 16),
              CustomBottom(
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(32),
                  onPressed: () async {
                    if (isActive && globalKey.currentState!.validate()) {
                      globalKey.currentState!.save();
                      await register.register(
                          emailAddress: emailAddress.text,
                          password: password.text);
                      if (register.state is RegisterSuccess) {
                        userName.clear();
                        emailAddress.clear();
                        password.clear();
                        confirmPassword.clear();
                      }
                    }
                  },
                  enableFeedback: isActive,
                  isLoading: widget.isLoading,
                  colorText: Colors.white,
                  colorBottom: kPrimaryColor,
                  text: 'Signup Now'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
