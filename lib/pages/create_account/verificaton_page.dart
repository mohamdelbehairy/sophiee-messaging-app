import 'dart:async';

import 'package:sophiee/cubit/auth/auth_settings/auth_settings_cubit.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/home_page.dart';
import 'package:sophiee/pages/login_page.dart';
import 'package:sophiee/utils/navigation.dart';
import 'package:sophiee/widgets/verification_page/verification_page_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key, this.userData});
  final UserModel? userData;

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  bool isEmailVerified = false;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    if (!isEmailVerified) {
      context.read<AuthSettingsCubit>().verificationEmail();
    }

    timer = Timer.periodic(const Duration(seconds: 3),
        (timer) => checkEmailVerified(userData: widget.userData));
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isDark = context.read<LoginCubit>().isDark;
    return PopScope(
        canPop: false,
        child: Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.grey.withValues(alpha: .010),
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness:
                        isDark ? Brightness.light : Brightness.dark,
                    systemNavigationBarColor:
                        isDark ? Colors.white : Colors.black,
                    systemNavigationBarIconBrightness:
                        isDark ? Brightness.light : Brightness.dark)),
            body: VerificationPageBody(
                size: size, isDark: isDark, isEmailVerified: isEmailVerified)));
  }

  Future checkEmailVerified({UserModel? userData}) async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      await Future.delayed(const Duration(seconds: 3));
      if (userData != null && userData.isFacebookAuth!) {
        // ignore: use_build_context_synchronously
        Navigation.push(context, const HomePage());

        timer?.cancel();
      } else {
        // ignore: use_build_context_synchronously
        Navigation.push(context, const LoginPage());

        timer?.cancel();
      }
    }
  }
}
