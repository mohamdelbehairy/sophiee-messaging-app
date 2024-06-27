import 'package:sophiee/constants.dart';
import 'package:flutter/material.dart';

class CustomProviderWay extends StatelessWidget {
  const CustomProviderWay(
      {super.key,
      required this.size,
      required this.onTap,
      required this.widget,
      required this.text,
      required this.top,
      required this.isLoading});

  final Size size;
  final Function() onTap;
  final Widget widget;
  final String text;
  final double top;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: isLoading ? size.height * 0.08 : size.height * .06,
        width: size.width,
        margin: EdgeInsets.only(
            right: size.width * .08, left: size.width * .08, top: top),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white.withOpacity(.3)),
            borderRadius: BorderRadius.circular(12)),
        child: isLoading
            ? const Center(child:  CircularProgressIndicator(color: kPrimaryColor))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget,
                  SizedBox(width: size.width * .015),
                  Text(text,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: size.height * .016,
                          fontWeight: FontWeight.w100)),
                ],
              ),
      ),
    );
  }
}
