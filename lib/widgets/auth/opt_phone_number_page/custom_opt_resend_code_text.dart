import 'package:sophiee/cubit/auth/phone_number_auth/phone_number_auth_cubit.dart';
import 'package:sophiee/widgets/auth/opt_phone_number_page/custom_opt_phone_number_text.dart';
import 'package:flutter/material.dart';

class CustomOptResendCodetext extends StatelessWidget {
  const CustomOptResendCodetext(
      {super.key,
      required this.size,
      required this.resendCode,
      required this.resendPhoneNumber});

  final Size size;
  final PhoneNumberAuthCubit resendCode;
  final String resendPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await resendCode.signInWithPhoneNumber(phoneNumber: resendPhoneNumber);
      },
      child: CustomOptPhoneNumbertext(
          size: size,
          text: 'Didn\'t receive code? \n Resend',
          textColor: Colors.white54,
          textSize: size.height * .014),
    );
  }
}
