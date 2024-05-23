import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';

import 'privacy_setting_page_card_body.dart';

class PrivacySettingPageCard extends StatelessWidget {
  const PrivacySettingPageCard({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 14, right: 14, top: 14),
        child: Container(
            width: size.width,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(blurRadius: 0, color: Colors.transparent)
                ]),
            child: BlocBuilder<GetUserDataCubit, GetUserDataStates>(
              builder: (context, state) {
                if (state is GetUserDataSuccess && state.userModel.isNotEmpty) {
                  final userData = state.userModel.firstWhere((element) =>
                      element.userID == FirebaseAuth.instance.currentUser!.uid);
                  return PrivacySettingPageCardBody(
                      size: size, userData: userData);
                } else {
                  return Container();
                }
              },
            )));
  }
}
