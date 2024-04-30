import 'package:sophiee/constants.dart';
import 'package:flutter/material.dart';

class CustomTextBottomSheetReadAndAgree extends StatelessWidget {
  const CustomTextBottomSheetReadAndAgree(
      {super.key,
      required this.isPressed,
      required this.isDark,
      required this.onTap});

  final bool isPressed;
  final bool isDark;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
              height: 15,
              width: 15,
              decoration:
                  BoxDecoration(color: isPressed ? kPrimaryColor : Colors.grey),
              child: isPressed
                  ? const Icon(Icons.check, size: 15, color: Colors.white)
                  : null),
        ),
        const SizedBox(width: 8),
        Text('I read & agree with',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black)),
        TextButton(onPressed: () {}, child: const Text('terms & policy'))
      ],
    );
  }
}
