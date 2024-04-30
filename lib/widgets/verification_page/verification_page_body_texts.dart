import 'package:sophiee/widgets/verification_page/custom_text_user_email.dart';
import 'package:sophiee/widgets/verification_page/custom_text_verification_page.dart';
import 'package:flutter/material.dart';

class VerificationPageTexts extends StatelessWidget {
  const VerificationPageTexts(
      {super.key, required this.size, required this.isDark});
  final Size size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextVerificationPage(
            text: 'Please verify your email',
            isDark: isDark,
            color: isDark ? Colors.white : const Color(0xff3a4352),
            fontWeight: FontWeight.bold,
            fontSize: size.height * .03),
        SizedBox(height: size.width * .035),
        CustomTextVerificationPage(
            text: 'You\'re almost there! We sent an email to',
            isDark: isDark,
            color: isDark ? Colors.white : const Color(0xff6f767d),
            fontWeight: FontWeight.w100,
            fontSize: size.height * .015),
        SizedBox(height: size.width * .01),
        CustomTextUserEmail(isDark: isDark, size: size),
        SizedBox(height: size.width * .04),
        CustomTextVerificationPage(
            text:
                'Just click on the link that email to complete your signup. If you don\'t see it, you may need to Check your spam folder.',
            isDark: isDark,
            color: isDark ? Colors.white : const Color(0xff6f767d),
            fontWeight: FontWeight.w100,
            fontSize: size.height * .015),
        SizedBox(height: size.width * .035),
        CustomTextVerificationPage(
            text: 'Still can\'t find the email? No problem.',
            isDark: isDark,
            color: isDark ? Colors.white : const Color(0xff6f767d),
            fontWeight: FontWeight.w100,
            fontSize: size.height * .015),
      ],
    );
  }
}
