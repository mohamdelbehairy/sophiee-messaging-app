import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/pages/register_page.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/widgets/login_page/login_page_bottom_sheet.dart';
import 'package:sophiee/utils/widget/auth/auth_positioned_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    return Stack(
      fit: StackFit.expand,
      children: [
        const Image(image: AssetImage(emailAuthImageUrl), fit: BoxFit.cover),
        AuthPositionedIcon(
            top: 50,
            right: 16,
            onPressed: () => Navigation.push(context, const RegisterPage()),
            child: const Text('Sign Up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
        AuthPositionedIcon(
            top: 50,
            left: 0,
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_sharp,
                size: 30, color: Colors.white)),
        LoginPageBottomSheet(isDark: isDark),
      ],
    );
  }
}
