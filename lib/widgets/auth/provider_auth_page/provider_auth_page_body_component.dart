import 'package:sophiee/widgets/auth/provider_auth_page/continue_with_email.dart';
import 'package:sophiee/widgets/auth/provider_auth_page/custom_text.dart';
import 'package:sophiee/widgets/auth/provider_auth_page/facebook_auth_way.dart';
import 'package:sophiee/widgets/auth/provider_auth_page/google_auth_way.dart';
import 'package:sophiee/widgets/auth/provider_auth_page/phone_number_auth_way.dart';
import 'package:sophiee/widgets/auth/provider_auth_page/provider_auth_page_custom_image.dart';
import 'package:sophiee/widgets/auth/provider_auth_page/provider_divider.dart';
import 'package:flutter/material.dart';

class ProviderAuthPageBodyComponent extends StatelessWidget {
  const ProviderAuthPageBodyComponent({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * .1),
      child: Column(
        children: [
          ProviderAuthPageCustomImage(size: size),
          ProviderAuthPageCustomtext(size: size),
          FacebookAuthWay(size: size),
          GoogleAuthWay(size: size),
          PhoneNumberAuthWay(size: size),
          SizedBox(height: size.width * .06),
          ProviderDivider(size: size),
          ContinueWithEmail(size: size)
        ],
      ),
    );
  }
}


