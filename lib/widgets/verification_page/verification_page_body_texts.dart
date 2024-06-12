import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/widgets/verification_page/custom_text_user_email.dart';
import 'package:sophiee/widgets/verification_page/custom_text_verification_page.dart';
import 'package:flutter/material.dart';

class VerificationPageTexts extends StatelessWidget {
  const VerificationPageTexts({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return Column(
      children: [
        CustomTextVerificationPage(
            text: 'Please verify your email',
            color: isDark ? Colors.white : const Color(0xff3a4352),
            fontWeight: FontWeight.bold,
            fontSize: size.height * .03),
        SizedBox(height: size.width * .035),
        CustomTextVerificationPage(
            text: 'You\'re almost there! We sent an email to',
            color: isDark ? Colors.white60 : const Color(0xff6f767d),
            fontWeight: FontWeight.w100,
            fontSize: size.height * .015),
        SizedBox(height: size.width * .01),
        CustomTextUserEmail(isDark: isDark, size: size),
        SizedBox(height: size.width * .04),
        CustomTextVerificationPage(
            text:
                'Just click on the link that email to complete your signup. If you don\'t see it, you may need to Check your spam folder.',
            color: isDark ? Colors.white60 : const Color(0xff6f767d),
            fontWeight: FontWeight.w100,
            fontSize: size.height * .015),
        SizedBox(height: size.width * .035),
        CustomTextVerificationPage(
            text: 'Still can\'t find the email? No problem.',
            color: isDark ? Colors.white60 : const Color(0xff6f767d),
            fontWeight: FontWeight.w100,
            fontSize: size.height * .015),
      ],
    );
  }
}
