import 'package:flutter/material.dart';
import 'package:sophiee/constants.dart';

class ProviderAuthPageCustomImage extends StatelessWidget {
  const ProviderAuthPageCustomImage({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(providerAuthPageImageUrl,
        fit: BoxFit.cover, height: size.height * .35);
  }
}