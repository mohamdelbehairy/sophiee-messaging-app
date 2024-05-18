import 'package:sophiee/constants.dart';
import 'package:sophiee/widgets/settings/search_item.dart';
import 'package:flutter/material.dart';

class CustomAppBarSetting extends StatelessWidget {
  const CustomAppBarSetting(
      {super.key,
      required this.appParTitle,
      required this.padding,
      this.widget,
      required this.hintText,
      required this.onChanged,
      this.suffixIcon,
      required this.onTap,
      required this.controller,
      this.arrowIcon,
      required this.size,
      this.mainAxisAlignment,
      this.onTapArrowIcon});
  final String appParTitle;
  final EdgeInsets padding;
  final Widget? widget;
  final Widget? arrowIcon;
  final String hintText;
  final Function(String) onChanged;
  final IconData? suffixIcon;
  final Function() onTap;
  final TextEditingController controller;
  final Size size;
  final MainAxisAlignment? mainAxisAlignment;
  final Function()? onTapArrowIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .18,
      width: size.width,
      decoration: const BoxDecoration(color: kPrimaryColor),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .04),
        child: Column(
          children: [
            SizedBox(height: size.height * .045),
            Row(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              children: [
                if (arrowIcon != null)
                  GestureDetector(
                      onTap: () => Navigator.pop(context), child: arrowIcon!),
                if (arrowIcon != null) SizedBox(width: size.width * .02),
                Padding(
                  padding: padding,
                  child: Text(appParTitle,
                      style: TextStyle(
                          fontSize: size.height * .034,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                if (widget != null) widget!,
              ],
            ),
            SizedBox(height: size.width * .02),
            SearchItem(
                controller: controller,
                onTap: onTap,
                hintText: hintText,
                onChanged: onChanged,
                suffixIcon: suffixIcon),
          ],
        ),
      ),
    );
  }
}
