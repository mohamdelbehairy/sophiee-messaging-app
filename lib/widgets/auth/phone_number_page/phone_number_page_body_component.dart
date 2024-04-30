import 'package:sophiee/cubit/auth/phone_number_auth/phone_number_auth_cubit.dart';
import 'package:sophiee/widgets/auth/custom_phone_number_image.dart';
import 'package:sophiee/widgets/auth/custom_phone_number_text.dart';
import 'package:sophiee/widgets/auth/phone_number_page/custom_phone_number_button.dart';
import 'package:sophiee/widgets/auth/phone_number_page/custom_phone_number_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneNumberPageBodyComponent extends StatelessWidget {
  const PhoneNumberPageBodyComponent(
      {super.key,
      required this.size,
      required this.controller,
      required this.phoneNumber,
      required this.number,
      required this.onChanged,
      required this.signInWithPhone,
      required this.isLoading});

  final Size size;
  final TextEditingController controller;
  final String phoneNumber;
  final String number;
  final Function(PhoneNumber) onChanged;
  final PhoneNumberAuthCubit signInWithPhone;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: size.height * .2),
        CustomPhoneNumberImage(size: size),
        CustomPhoneNumberText(
            size: size,
            firsttextSize: size.height * .035,
            firsttext: 'Phone Verification',
            secondtext:
                'We need to register your phone\n before getting started!'),
        CustomPhoneNumberTextField(
            enabled: !isLoading,
            size: size,
            controller: controller,
            onChanged: onChanged),
        CustomPhoneNumberButton(
            size: size,
            isLoading: isLoading,
            onPressed: () async {
              if (phoneNumber.isNotEmpty) {
                await signInWithPhone.signInWithPhoneNumber(
                    phoneNumber: phoneNumber);

                debugPrint('phone number: $phoneNumber');
              }
            })
      ]),
    );
  }
}
