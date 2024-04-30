import 'dart:async';

import 'package:sophiee/cubit/auth/auth_settings/auth_settings_cubit.dart';
import 'package:sophiee/pages/login_page.dart';
import 'package:sophiee/widgets/verification_page/verification_page_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getnav;

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key, required this.isDark});
  final bool isDark;

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

    timer =
        Timer.periodic(const Duration(seconds: 3), (timer) => checkEmailVerified());
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.grey.withOpacity(.010),
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness:
                      widget.isDark ? Brightness.light : Brightness.dark,
                  systemNavigationBarColor:
                      widget.isDark ? Colors.white : Colors.black,
                  systemNavigationBarIconBrightness:
                      widget.isDark ? Brightness.light : Brightness.dark)),
          body: VerificationPageBody(
              size: size,
              isDark: widget.isDark,
              isEmailVerified: isEmailVerified)),
    );
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      await Future.delayed(const Duration(seconds: 3));
      getnav.Get.to(() => const LoginPage(),
          transition: getnav.Transition.leftToRight);
      timer?.cancel();
    }
  }
}
