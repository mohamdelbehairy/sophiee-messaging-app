import 'package:sophiee/constants.dart';
import 'package:flutter/material.dart';

class CustomPhoneNumberImage extends StatelessWidget {
  const CustomPhoneNumberImage({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(phoneNumberImageUrl,
        fit: BoxFit.cover, height: size.height * .35);
  }
}
