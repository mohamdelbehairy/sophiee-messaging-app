import 'package:flutter/material.dart';

class OnBoardringPageItem extends StatelessWidget {
  const OnBoardringPageItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subTitle,
      required this.size});

  final String imageUrl;
  final String title;
  final String subTitle;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imageUrl, fit: BoxFit.cover),
        Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w800, fontSize: size.width * .068)),
        SizedBox(height: size.width * .015),
        Text(subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: size.width * .035,
                color: Colors.white54))
      ],
    );
  }
}
