import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/utils/widget/custom_bottom.dart';
import 'package:sophiee/utils/widget/auth/auth_bottom_sheet_top_text.dart';
import 'package:sophiee/widgets/login_page/custom_forget_password.dart';
import 'package:sophiee/utils/widget/auth/text_field_email.dart';
import 'package:sophiee/utils/widget/auth/text_field_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginPageBottomSheetBody extends StatefulWidget {
  const LoginPageBottomSheetBody(
      {super.key, required this.isDark, required this.isLoading});
  final bool isDark;
  final bool isLoading;

  @override
  State<LoginPageBottomSheetBody> createState() =>
      _LoginPageBottomSheetBodyState();
}

class _LoginPageBottomSheetBodyState extends State<LoginPageBottomSheetBody> {
  GlobalKey<FormState> globalKey = GlobalKey();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    emailAddress.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var login = (context).read<LoginCubit>();
    // final isDark = context.read<LoginCubit>().isDark;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 32, left: 32),
        child: Form(
          key: globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthBottomSheetTopText(isDark: widget.isDark, text: 'Get Login'),
              const SizedBox(height: 16),
              TextFieldEmail(
                  emailAddress: emailAddress, isLoading: !widget.isLoading),
              const SizedBox(height: 8),
              TextFieldPassword(
                  password: password, isLoading: !widget.isLoading),
              const SizedBox(height: 22),
              CustomBottom(
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(32),
                  onPressed: () async {
                    if (globalKey.currentState!.validate()) {
                      globalKey.currentState!.save();
                      await login.login(
                          context: context,
                          emailAddress: emailAddress.text,
                          password: password.text);
                      if (login.state is LoginSuccess &&
                          FirebaseAuth.instance.currentUser!.emailVerified) {
                        emailAddress.clear();
                        password.clear();
                      } 
                    }
                  },
                  isLoading: widget.isLoading,
                  colorText: Colors.white,
                  colorBottom: kPrimaryColor,
                  text: 'Get Login'),
              CustomForgetPassword(emailAddress: emailAddress),
            ],
          ),
        ),
      ),
    );
  }
}
