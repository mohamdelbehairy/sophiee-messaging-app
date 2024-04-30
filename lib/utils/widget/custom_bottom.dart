import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom(
      {super.key,
      required this.text,
      required this.colorBottom,
      required this.colorText,
      required this.onPressed,
      this.isLoading = false,
      this.enableFeedback = true,
      required this.borderRadius,
      required this.width, this.margin});
  final String text;
  final Color colorBottom;
  final Color colorText;
  final Function() onPressed;
  final bool isLoading;
  final bool enableFeedback;
  final BorderRadius borderRadius;
  final double width;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      decoration: BoxDecoration(borderRadius: borderRadius, color: colorBottom),
      child: MaterialButton(
          enableFeedback: enableFeedback,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: onPressed,
          child: isLoading
              ? SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(colorText)))
              : Text(text, style: TextStyle(color: colorText))),
    );
  }
}
