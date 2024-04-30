import 'package:sophiee/pages/auth/phone_number_page.dart';
import 'package:sophiee/widgets/auth/provider_auth_page/custom_provider_way.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getnav;

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
        onTap: () => getnav.Get.to(() =>  PhoneNumberPage(size: size),
            transition: getnav.Transition.rightToLeft),
        widget: Icon(Icons.phone, color: Colors.teal.shade700));
  }
}
