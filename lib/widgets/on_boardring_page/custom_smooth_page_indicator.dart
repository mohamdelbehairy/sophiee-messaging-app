import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator(
      {super.key, required this.controller, required this.size});

  final PageController controller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: controller,
        count: 3,
        effect: WormEffect(
            dotHeight: size.width * .03,
            dotWidth: size.width * .03,
            spacing: size.width * .04,
            dotColor: Colors.teal.shade700,
            activeDotColor: Colors.white),
        onDotClicked: (index) => controller.animateToPage(index,
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn));
  }
}
