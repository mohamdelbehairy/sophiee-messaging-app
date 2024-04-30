import 'package:sophiee/constants.dart';
import 'package:sophiee/pages/auth/provider_auth_page.dart';
import 'package:sophiee/utils/widget/custom_bottom.dart';
import 'package:sophiee/widgets/on_boardring_page/custom_smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getnav;

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
                  getnav.Get.to(() => const ProviderAuthPage(),
                      transition: getnav.Transition.rightToLeft,duration: const Duration(seconds: 1));
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
