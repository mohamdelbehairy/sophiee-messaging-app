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
      required this.size});
  final Color color;
  final IconData icon;
  final double iconSize;
  final String text;
  final IconData? icon2;
  final bool enableFeedback;
  final Color textColor;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        IconButton(
          onPressed: () {},
          enableFeedback: enableFeedback,
          splashColor: Colors.white,
          highlightColor: Colors.white,
          icon: Icon(
            icon2,
            size: size.width * .044,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
