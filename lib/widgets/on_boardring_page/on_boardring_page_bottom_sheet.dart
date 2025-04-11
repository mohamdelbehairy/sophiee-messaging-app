import 'package:sophiee/constants.dart';
import 'package:sophiee/pages/auth/provider_auth_page.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/utils/widget/custom_bottom.dart';
import 'package:flutter/material.dart';

import 'custom_smooth_page_indicator.dart';

class OnBoardringPageBottomSheet extends StatelessWidget {
  const OnBoardringPageBottomSheet(
      {super.key,
      required this.size,
      required this.controller,
      required this.isLastPage});

  final Size size;
  final PageController controller;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .15,
      width: size.width,
      decoration: const BoxDecoration(
          color: kPrimaryColor, boxShadow: [BoxShadow(color: kPrimaryColor)]),
      child: Column(
        children: [
          SizedBox(height: size.width * .06),
          CustomSmoothPageIndicator(controller: controller, size: size),
          SizedBox(height: size.width * .06),
          CustomBottom(
              text: isLastPage ? 'Get Started' : 'Next',
              colorBottom: Colors.white,
              colorText: kPrimaryColor,
              onPressed: () {
                if (isLastPage) {
                  Navigation.go(context, const ProviderAuthPage());
                } else {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                }
              },
              borderRadius: BorderRadius.circular(32),
              width: size.width * .8)
        ],
      ),
    );
  }
}
