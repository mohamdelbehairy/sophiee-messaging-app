import 'package:flutter/material.dart';

class MyFriendItems extends StatelessWidget {
  const MyFriendItems(
      {super.key,
      required this.text,
      required this.textButton,
      required this.onTap});
  final String text;
  final String textButton;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme.of(context).textTheme.bodyLarge),
          GestureDetector(
            onTap: onTap,
            child: Text(
              textButton,
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.normal,
                  fontSize: size.height * .02),
            ),
          ),
        ],
      ),
    );
  }
}
