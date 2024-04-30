import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/google_auth/google_auth_cubit.dart';
import 'package:sophiee/cubit/auth/phone_number_auth/phone_number_auth_cubit.dart';
import 'package:sophiee/pages/create_account/add_user_data_page.dart';
import 'package:sophiee/pages/home_page.dart';
import 'package:sophiee/widgets/auth/opt_phone_number_page/opt_phone_number_page_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class OptPhoneNumberPage extends StatelessWidget {
  const OptPhoneNumberPage(
      {super.key,
      required this.size,
      required this.phoneNumber,
      required this.resendPhoneNumber});
  final Size size;
  final String phoneNumber;
  final String resendPhoneNumber;

  @override
  Widget build(BuildContext context) {
    var isUserDataStored = context.read<GoogleAuthCubit>();
    var verifyPhoneNumber = context.read<PhoneNumberAuthCubit>();
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<PhoneNumberAuthCubit, PhoneNumberAuthState>(
          listener: (context, state) async {
            if (state is VerifyPhoneNumberAuthSuccess) {
              debugPrint('لقد نجحنااااااااااااااااااااااااااا');
              debugPrint(
                  'isVerified: ${FirebaseAuth.instance.currentUser!.phoneNumber}');
              await Future.delayed(const Duration(seconds: 3));
              if (!await isUserDataStored.isUserDataStored(
                  userID: FirebaseAuth.instance.currentUser!.uid)) {
                getnav.Get.to(() => const AddUserDataPage(),
                    transition: getnav.Transition.rightToLeft);
              } else {
                getnav.Get.to(() => const HomePage(),
                    transition: getnav.Transition.rightToLeft);
              }
            }
          },
          builder: (context, state) {
            return Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                      Color(0xff32d59a),
                      Color(0xff32cba0),
                      Color(0xff2fc2a8),
                      kPrimaryColor
                    ])),
                child: OptPhoneNumberPageBody(
                    resendPhoneNumber: resendPhoneNumber,
                    verifyPhoneNumber: verifyPhoneNumber,
                    size: size,
                    phoneNumber: phoneNumber));
          },
        ));
  }
}
