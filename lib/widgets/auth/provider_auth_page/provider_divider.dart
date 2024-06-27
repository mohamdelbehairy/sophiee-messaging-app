import 'package:sophiee/widgets/auth/provider_auth_page/custom_divider.dart';
import 'package:flutter/material.dart';

class ProviderDivider extends StatelessWidget {
  const ProviderDivider({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProviderAuthPageCustomDivider(
            size: size, left: size.width * .095, right: size.width * .03),
        const Text('or'),
        ProviderAuthPageCustomDivider(
            size: size, left: size.width * .03, right: size.width * .08),
      ],
    );
  }
}
