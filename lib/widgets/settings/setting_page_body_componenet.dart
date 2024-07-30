import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../cubit/delete_account/delete_account_cubit.dart';
import '../../models/users_model.dart';
import '../../utils/widget/loading_animation_circle_indicator.dart';
import 'settings_card_one/settings_page_card_one.dart';
import 'settings_card_two/settings_page_card_two.dart';
import 'settings_page_app_bar.dart';

class SettingPageBodyComponent extends StatelessWidget {
  const SettingPageBodyComponent(
      {super.key,
      required this.inAsyncCall,
      required this.size,
      required this.user,
      required this.onPressed,
      required this.deleteAccount});
  final bool inAsyncCall;
  final Size size;
  final UserModel user;
  final Function() onPressed;
  final DeleteAccountCubit deleteAccount;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      opacity: 0.1,
      inAsyncCall: inAsyncCall,
      progressIndicator: LoadingAnimationCircleIndicator(size: size),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SettingsPageAppBar(
                appParTitle: 'Setting',
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                size: size,
                widget: TextButton(
                    onPressed: () {},
                    child: Text('Reset',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * .039)))),
            SettingsPageCardOne(size: size, userData: user),
            SettingsPageCardTwo(
                size: size,
                onPressed: onPressed,
                deleteAccount: () async {
                  await deleteAccount.deleteAccount();
                }),
          ],
        ),
      ),
    );
  }
}
