import 'package:sophiee/constants.dart';
import 'package:sophiee/widgets/auth/provider_auth_page/continue_with_email.dart';
import 'package:sophiee/widgets/auth/provider_auth_page/custom_provider_way.dart';
import 'package:sophiee/widgets/auth/provider_auth_page/custom_text.dart';
import 'package:sophiee/widgets/auth/provider_auth_page/google_auth_way.dart';
import 'package:sophiee/widgets/auth/provider_auth_page/phone_number_auth_way.dart';
import 'package:sophiee/widgets/auth/provider_auth_page/provider_divider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProviderAuthPageBodyComponent extends StatelessWidget {
  const ProviderAuthPageBodyComponent({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * .1),
      child: Column(
        children: [
          Image.asset(providerAuthPageImageUrl,
              fit: BoxFit.cover, height: size.height * .35),
          ProviderAuthPageCustomtext(size: size),
          CustomProviderWay(
              isLoading: false,
              size: size,
              top: size.width * .05,
              text: 'Continue with Facebook',
              onTap: () {},
              widget: const Icon(FontAwesomeIcons.facebook, color: Colors.blue)),
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
