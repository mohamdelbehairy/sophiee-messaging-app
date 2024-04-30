import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_cubit.dart';
import 'package:sophiee/cubit/user_date/get_user_data/get_user_data_state.dart';
import 'package:sophiee/widgets/verification_page/custom_text_verification_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextUserEmail extends StatelessWidget {
  const CustomTextUserEmail(
      {super.key, required this.isDark, required this.size});
  final bool isDark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataStates>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          final currentUser = FirebaseAuth.instance.currentUser;
          if (currentUser != null) {
            final userData = state.userModel
                .firstWhere((element) => element.userID == currentUser.uid);
            return CustomTextVerificationPage(
                text: userData.emailAddress,
                isDark: isDark,
                color: isDark ? Colors.white : const Color(0xff3a4352),
                fontWeight: FontWeight.bold,
                fontSize: size.height * .018);
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }
}
