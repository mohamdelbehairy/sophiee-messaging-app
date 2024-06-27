import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/auth_settings/auth_settings_cubit.dart';
import 'package:sophiee/cubit/auth/facebook_auth/facebook_auth_cubit.dart';
import 'package:sophiee/cubit/auth/google_auth/google_auth_cubit.dart';
import 'package:sophiee/cubit/user_date/user_token/user_token_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/pages/auth/provider_auth_page.dart';
import 'package:sophiee/widgets/settings/settings_page_app_bar.dart';
import 'package:sophiee/widgets/settings/settings_card_one/settings_page_card_one.dart';
import 'package:sophiee/widgets/settings/settings_card_two/settings_page_card_two.dart';
import 'package:get/get.dart' as getnav;

class SettingsPageBody extends StatefulWidget {
  const SettingsPageBody(
      {super.key,
      required this.size,
      required this.isDark,
      required this.user});

  final Size size;
  final bool isDark;
  final UserModel user;

  @override
  State<SettingsPageBody> createState() => _SettingsPageBodyState();
}

class _SettingsPageBodyState extends State<SettingsPageBody> {
  bool showProgressIndicator = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0.1,
      inAsyncCall: showProgressIndicator,
      progressIndicator: LoadingAnimationWidget.discreteCircle(
          color: kPrimaryColor, size: widget.size.height * .04),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SettingsPageAppBar(
                appParTitle: 'Setting',
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                size: widget.size,
                widget: TextButton(
                    onPressed: () {},
                    child: Text('Reset',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: widget.size.width * .039)))),
            SettingsPageCardOne(size: widget.size, userData: widget.user),
            SettingsPageCardTwo(size: widget.size, onPressed: onPressed),
          ],
        ),
      ),
    );
  }

  void logOut() async {
    var signOut = context.read<AuthSettingsCubit>();
    if (widget.user.isGoogleAuth != null) {
      context.read<GoogleAuthCubit>().isLoading = false;
      await signOut.googleSignOut();
    } else if (widget.user.isFacebookAuth != null) {
      context.read<FacebookAuthCubit>().isLoading = false;
      await signOut.facebookSignOut();
    } else {
      var removeToken = context.read<UserTokenCubit>();
      await removeToken.updateUserToken(token: '');
      await signOut.signOut();
    }

    getnav.Get.to(() => const ProviderAuthPage(),
        transition: getnav.Transition.leftToRight);
  }

  void onPressed() async {
    Navigator.pop(context);
    showProgressIndicator = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    logOut();
  }
}
