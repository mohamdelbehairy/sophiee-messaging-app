import 'package:sophiee/constants.dart';
import 'package:sophiee/utils/widget/custom_bottom.dart';
import 'package:flutter/material.dart';

class CustomPhoneNumberButton extends StatelessWidget {
  const CustomPhoneNumberButton(
      {super.key, required this.size, required this.onPressed, required this.isLoading});
  final Size size;
  final Function() onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomBottom(
      isLoading: isLoading,
        text: 'Send the code',
        margin: EdgeInsets.symmetric(horizontal: size.width * .08),
        colorBottom: Colors.white,
        colorText: kPrimaryColor,
        onPressed: onPressed,
        borderRadius: BorderRadius.circular(8),
        width: size.width);
  }
}
