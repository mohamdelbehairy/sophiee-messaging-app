import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/google_auth/google_auth_cubit.dart';
import 'package:sophiee/cubit/auth/phone_number_auth/phone_number_auth_cubit.dart';
import 'package:sophiee/cubit/user_date/user_token/user_token_cubit.dart';
import 'package:sophiee/pages/create_account/add_user_data_page.dart';
import 'package:sophiee/pages/home_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/utils/navigation.dart';

import '../../widgets/auth/opt_phone_number_page/opt_phone_number_page_body.dart';

class OptPhoneNumberPage extends StatelessWidget {
  const OptPhoneNumberPage(
      {super.key,
      required this.size,
      required this.phoneNumber,
      required this.resendPhoneNumber,
      required this.optController});
  final Size size;
  final String phoneNumber;
  final String resendPhoneNumber;
  final TextEditingController optController;

  @override
  @override
  Widget build(BuildContext context) {
    var isUserDataStored = context.read<GoogleAuthCubit>();
    var verifyPhoneNumber = context.read<PhoneNumberAuthCubit>();
    var token = context.read<UserTokenCubit>();

    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<PhoneNumberAuthCubit, PhoneNumberAuthState>(
          listener: (context, state) async {
            if (state is VerifyPhoneNumberAuthSuccess) {
              debugPrint('لقد نجحنااااااااااااااااااااااااااا');
              debugPrint(
                  'isVerified: ${FirebaseAuth.instance.currentUser!.phoneNumber}');
              await Future.delayed(const Duration(seconds: 2));
              if (!await isUserDataStored.isUserDataStored(
                  userID: FirebaseAuth.instance.currentUser!.uid)) {
                // ignore: use_build_context_synchronously
                Navigation.push(context, const AddUserDataPage());

                Future.delayed(const Duration(seconds: 2));
                optController.clear();
              } else {
                String? getToken = await token.getUserToken();
                // ignore: use_build_context_synchronously
                Navigation.push(context, const HomePage());

                Future.delayed(const Duration(seconds: 2));
                await token.updateUserToken(token: getToken);
                optController.clear();
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
                    optController: optController,
                    resendPhoneNumber: resendPhoneNumber,
                    verifyPhoneNumber: verifyPhoneNumber,
                    size: size,
                    phoneNumber: phoneNumber));
          },
        ));
  }
}
