import 'package:sophiee/pages/login_page.dart';
import 'package:sophiee/pages/register_page.dart';
import 'package:sophiee/utils/widget/custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getnav;

class ContinueWithEmail extends StatelessWidget {
  const ContinueWithEmail({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.only(
              left: size.width * .08,
              right: size.width * .08,
              top: size.height * .02),
          child: CustomBottom(
              text: 'Continue with email',
              colorBottom: Colors.white,
              colorText: Colors.black,
              onPressed: () => getnav.Get.to(() => const LoginPage(),
                  transition: getnav.Transition.rightToLeft),
              borderRadius: BorderRadius.circular(32),
              width: size.width)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don\'t have an account?',
              style: TextStyle(
                  fontSize: size.height * .013,
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.w100)),
          TextButton(
              onPressed: () => getnav.Get.to(() => const RegisterPage(),
                  transition: getnav.Transition.rightToLeft),
              child: Text('Sign up',
                  style: TextStyle(
                      color: Colors.black, fontSize: size.height * .014)))
        ],
      ),
    ]);
  }
}
