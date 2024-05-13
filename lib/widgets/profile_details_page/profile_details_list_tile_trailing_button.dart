import 'package:flutter/material.dart';

class ProfileDetailsListTileTrailingButton extends StatelessWidget {
  const ProfileDetailsListTileTrailingButton(
      {super.key,
      required this.size,
      required this.onTap,
      required this.buttonName,
      required this.borderColor,
      required this.buttonColor,
      required this.buttonNameColor});

  final Size size;
  final Function() onTap;
  final String buttonName;
  final Color borderColor, buttonColor, buttonNameColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * .045,
        width: size.width * .2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.height * .04),
            color: buttonColor,
            border: Border.all(color: borderColor)),
        child: Center(
          child: Text(buttonName,
              style: TextStyle(
                  color: buttonNameColor,
                  fontSize: 10,
                  fontWeight: FontWeight.normal)),
        ),
      ),
    );
  }
}
