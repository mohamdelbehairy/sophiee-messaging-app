import 'package:flutter/material.dart';

class CustomItemsTwo extends StatelessWidget {
  const CustomItemsTwo(
      {super.key,
      required this.color,
      required this.icon,
      required this.iconSize,
      required this.text,
      this.icon2,
      this.enableFeedback = true,
      required this.textColor,
      required this.size,
      required this.onTap, this.widget});
  final Color color;
  final IconData icon;
  final double iconSize;
  final String text;
  final IconData? icon2;
  final Widget? widget;
  final bool enableFeedback;
  final Color textColor;
  final Size size;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: enableFeedback,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: size.width * .03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: size.width * .042,
                    backgroundColor: color,
                    child: Icon(icon, color: Colors.white, size: iconSize)),
                SizedBox(width: size.width * .02),
                Text(text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * .039,
                        color: textColor))
              ],
            ),
            if (icon2 != null)
              Icon(icon2, size: size.width * .044, color: Colors.grey),
            if (widget != null) widget!
          ],
        ),
      ),
    );
  }
}
