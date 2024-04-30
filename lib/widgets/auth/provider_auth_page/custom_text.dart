import 'package:flutter/material.dart';

class ProviderAuthPageCustomtext extends StatelessWidget {
  const ProviderAuthPageCustomtext({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Text('Let\'s you in',
        style: TextStyle(
            color: Colors.white,
            fontSize: size.height * .05,
            fontWeight: FontWeight.w100));
  }
}
