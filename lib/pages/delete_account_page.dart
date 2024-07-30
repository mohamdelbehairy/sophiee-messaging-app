import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/delete_account/delete_account_cubit.dart';
import 'package:get/get.dart' as getnav;
import 'package:sophiee/pages/auth/provider_auth_page.dart';

import '../cubit/auth/auth_settings/auth_settings_cubit.dart';
import '../cubit/auth/facebook_auth/facebook_auth_cubit.dart';
import '../cubit/auth/google_auth/google_auth_cubit.dart';
import '../services/calls/user_call_init.dart';
import '../utils/widget/loading_animation_circle_indicator.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  @override
  void initState() {
    context.read<DeleteAccountCubit>().deleteAccount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var signOut = context.read<AuthSettingsCubit>();

    return BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) async {
        if (state is DeleteAccountSuccess) {
          context.read<GoogleAuthCubit>().isLoading = false;
          context.read<FacebookAuthCubit>().isLoading = false;

          await signOut.googleSignOut();
          await signOut.facebookSignOut();
          await signOut.signOut();
          UserCallInit.onUserLogout();
          final prefs = await SharedPreferences.getInstance();
          var userID = prefs.getString('storeUser');
          getnav.Get.to(() => const ProviderAuthPage(),
              transition: getnav.Transition.rightToLeft);
          await Future.delayed(const Duration(seconds: 2));
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userID)
              .delete();
          log('account deleted: $userID');
          await prefs.remove('storeUser');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is DeleteAccountLoading ? true : false,
          progressIndicator: LoadingAnimationCircleIndicator(size: size),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: const Text('Deleting Account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.normal)),
            ),
          ),
        );
      },
    );
  }
}
