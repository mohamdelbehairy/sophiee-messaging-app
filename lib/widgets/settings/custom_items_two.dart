import 'package:flutter/material.dart';

class CustomItemsTwo extends StatelessWidget {
  const CustomItemsTwo(
      {super.key,
      required this.color,
      required this.icon,
      required this.size,
      required this.text,
      this.icon2,
      this.enableFeedback = true,
      required this.textColor});
  final Color color;
  final IconData icon;
  final double size;
  final String text;
  final IconData? icon2;
  final bool enableFeedback;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: color,
              child: Icon(
                icon,
                color: Colors.white,
                size: size,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: textColor,
              ),
            )
          ],
        ),
        IconButton(
          onPressed: () {},
          enableFeedback: enableFeedback,
          splashColor: Colors.white,
          highlightColor: Colors.white,
          icon: Icon(
            icon2,
            size: 18,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
