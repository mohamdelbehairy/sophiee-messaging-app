import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/pages/login_page.dart';
import 'package:sophiee/utils/widget/auth/auth_positioned_icon.dart';
import 'package:sophiee/widgets/register_page/register_page_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class RegisterPageBody extends StatelessWidget {
  const RegisterPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;

    return Stack(
      fit: StackFit.expand,
      children: [
        const Image(
            image: AssetImage('assets/images/signPage.jpg'), fit: BoxFit.cover),
        AuthPositionedIcon(
            top: 50,
            right: 16,
            onPressed: () => getnav.Get.to(() => const LoginPage(),
                transition: getnav.Transition.leftToRight),
            child: const Text('Get Login',
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
        RegisterPageBottomSheet(isDark: isDark),
      ],
    );
  }
}

