import 'package:sophiee/pages/auth/phone_number_page.dart';
import 'package:flutter/material.dart';
import 'package:sophiee/utils/navigation.dart';

import 'custom_provider_way.dart';

class PhoneNumberAuthWay extends StatelessWidget {
  const PhoneNumberAuthWay({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomProviderWay(
        isLoading: false,
        size: size,
        top: size.width * .03,
        text: 'Continue with Phone',
        onTap: () => Navigation.push(context, PhoneNumberPage(size: size)),
        widget: Icon(Icons.phone, color: Colors.teal.shade700));
  }
}
