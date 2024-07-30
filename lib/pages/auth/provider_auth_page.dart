import 'package:sophiee/widgets/auth/provider_auth_page/provider_auth_page_body.dart';
import 'package:flutter/material.dart';

class ProviderAuthPage extends StatelessWidget {
  const ProviderAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
        canPop: false, child: Scaffold(body: ProviderAuthPageBody()));
  }
}
