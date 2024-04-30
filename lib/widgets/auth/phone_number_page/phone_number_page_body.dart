import 'package:sophiee/cubit/auth/phone_number_auth/phone_number_auth_cubit.dart';
import 'package:sophiee/pages/auth/opt_phone_number_page.dart';
import 'package:sophiee/utils/widget/show_top_snack_bar/show_top_snack_bar_failure.dart';
import 'package:sophiee/widgets/auth/phone_number_page/phone_number_page_body_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class PhoneNumberPageBody extends StatefulWidget {
  const PhoneNumberPageBody({super.key, required this.size});

  final Size size;

  @override
  State<PhoneNumberPageBody> createState() => _PhoneNumberPageBodyState();
}

class _PhoneNumberPageBodyState extends State<PhoneNumberPageBody> {
  TextEditingController controller = TextEditingController();

  String phoneNumber = '';
  String number = '';

  @override
  void dispose() {
    controller.dispose();
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
                  size: widget.size,
                  phoneNumber: number,
                  resendPhoneNumber: phoneNumber),
              transition: getnav.Transition.rightToLeft);
        }
        if (state is SendPhoneNumberAuthFailure) {
          if (state.errorMessage == 'invalid-phone-number') {
            showTopSnackBarFailure(
                context: context,
                maxLines: 3,
                message:
                    'Sorry, the provided phone number is not valid. Please double-check the number and try again.');
          }
          if (state.errorMessage == 'too-many-requests') {
            showTopSnackBarFailure(
                context: context,
                maxLines: 3,
                message:
                    "Apologies, but we've blocked requests from your device temporarily due to unusual activity. Please try again later. Thank you for your understanding.");
          } 
           if (state.errorMessage == 'network-request-failed') {
            showTopSnackBarFailure(
                context: context,
                maxLines: 3,
                message:
                    "Sorry, the network request failed. Please check your network connection and try again.");
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
        );
      },
    );
  }
}
