import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:sophiee/cubit/auth/phone_number_auth/phone_number_auth_cubit.dart';
import 'package:sophiee/pages/auth/opt_phone_number_page.dart';
import 'package:sophiee/widgets/auth/phone_number_page/phone_number_page_body_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;
import 'package:telephony/telephony.dart';

import '../../../models/awsome_dialog_model.dart';
import '../../../utils/custom_awsome_dialog.dart';

class PhoneNumberPageBody extends StatefulWidget {
  const PhoneNumberPageBody({super.key, required this.size});

  final Size size;

  @override
  State<PhoneNumberPageBody> createState() => _PhoneNumberPageBodyState();
}

class _PhoneNumberPageBodyState extends State<PhoneNumberPageBody> {
  TextEditingController controller = TextEditingController();
  TextEditingController optController = TextEditingController();
  final Telephony telephony = Telephony.instance;

  String phoneNumber = '';
  String number = '';

  @override
  void dispose() {
    controller.dispose();
    optController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var signInWithPhone = context.read<PhoneNumberAuthCubit>();
    return BlocConsumer<PhoneNumberAuthCubit, PhoneNumberAuthState>(
      listener: (context, state) {
        if (state is PhoneNumberAuthLoading) {
          signInWithPhone.isLoading = state.isLoading;
        }
        if (state is SendPhoneNumberAuthSuccess) {
          getnav.Get.to(
              () => OptPhoneNumberPage(
                  optController: optController,
                  size: widget.size,
                  phoneNumber: phoneNumber,
                  resendPhoneNumber: phoneNumber),
              transition: getnav.Transition.rightToLeft);
        }
        if (state is SendPhoneNumberAuthFailure) {
          if (state.errorMessage == 'invalid-phone-number') {
            customAwsomeDialog(
                awsomeDialogModel: AwsomeDialogModel(
                    context: context,
                    autoHide: const Duration(seconds: 4),
                    horizontal: 16,
                    title: 'Login Failed',
                    desc:
                        'Sorry, the provided phone number is not valid. Please double-check the number and try again.',
                    dialogType: DialogType.error));
          }
          if (state.errorMessage == 'too-many-requests') {
             customAwsomeDialog(
                awsomeDialogModel: AwsomeDialogModel(
                    context: context,
                    autoHide: const Duration(seconds: 4),
                    horizontal: 16,
                    title: 'Login Failed',
                    desc:
                        "Apologies, but we've blocked requests from your device temporarily due to unusual activity. Please try again later. Thank you for your understanding.",
                    dialogType: DialogType.error));
          }
          if (state.errorMessage == 'network-request-failed') {
             customAwsomeDialog(
                awsomeDialogModel: AwsomeDialogModel(
                    context: context,
                    autoHide: const Duration(seconds: 4),
                    horizontal: 16,
                    title: 'Login Failed',
                    desc:
                        'Sorry, the network request failed. Please check your network connection and try again.',
                    dialogType: DialogType.error));
          }
        }
      },
      builder: (context, state) {
        return PhoneNumberPageBodyComponent(
          isLoading: signInWithPhone.isLoading,
          signInWithPhone: signInWithPhone,
          size: widget.size,
          controller: controller,
          phoneNumber: phoneNumber,
          number: number,
          onChanged: (value) {
            setState(() {
              phoneNumber = value.completeNumber;
              number = '${value.countryCode} ${value.number}';
            });
          },
          listenToInComingSms: listenToInComingSms,
        );
      },
    );
  }

  void listenToInComingSms() {
    telephony.listenIncomingSms(
        onNewMessage: (SmsMessage message) {
          if (message.body!.contains('sophiee-messaging-app')) {
            String optCode = message.body!.substring(0, 6);
            setState(() {
              optController.text = optCode;
            });
          }
        },
        listenInBackground: false);
  }
}
