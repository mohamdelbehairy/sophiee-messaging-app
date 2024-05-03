import 'package:flutter/material.dart';


class ProfilePageRowSeeAll extends StatelessWidget {
  const ProfilePageRowSeeAll(
      {super.key,
      required this.size,
      required this.isDark,
      required this.textOne,
      required this.textTwo, required this.onPressed});

  final Size size;
  final bool isDark;
  final String textOne;
  final String textTwo;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(textOne,
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: size.height * .02)),
          TextButton(
            onPressed: onPressed,
            child: Text(
              textTwo,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: size.width * .04,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
