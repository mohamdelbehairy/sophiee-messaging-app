import 'package:sophiee/widgets/verification_page/verification_page_body_custom_top_icon.dart';
import 'package:sophiee/widgets/verification_page/verification_page_body_texts.dart';
import 'package:sophiee/widgets/verification_page/verification_page_custom_button.dart';
import 'package:sophiee/widgets/verification_page/verification_page_progress_indicator.dart';
import 'package:flutter/material.dart';

class VerificationPageBody extends StatelessWidget {
  const VerificationPageBody(
      {super.key,
      required this.isDark,
      required this.isEmailVerified,
      required this.size});

  final bool isDark;
  final bool isEmailVerified;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .025),
      child: Column(
        children: [
          VerificationPageCustomTopIcon(size: size),
          SizedBox(height: size.width * .05),
          VerificationPageTexts(size: size),
          if (isEmailVerified)
            VerificationPageProgressIndicator(isDark: isDark),
          SizedBox(height: size.width * .15),
          if (!isEmailVerified)
            VerificationPageCustomButton(size: size, isDark: isDark)
        ],
      ),
    );
  }
}
