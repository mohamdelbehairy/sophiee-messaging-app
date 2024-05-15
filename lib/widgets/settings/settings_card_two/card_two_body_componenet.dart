import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/widgets/settings/settings_card_two/card_two_logout_item.dart';
import 'package:sophiee/widgets/settings/settings_card_two/card_two_delete_item.dart';

class CardTwoBodyComponenet extends StatelessWidget {
  const CardTwoBodyComponenet(
      {super.key, required this.size, required this.onTap});

  final Size size;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .035),
      child: Container(
        height: size.height * .15,
        width: size.width,
        decoration: const BoxDecoration(
            color: Colors.transparent,
            boxShadow: [BoxShadow(blurRadius: 0, color: Colors.transparent)]),
        child: Card(
          color:
              context.read<LoginCubit>().isDark ? cardDarkModeBackground : Colors.white,
          elevation: context.read<LoginCubit>().isDark ? 1 : 0,
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * .045,
                top: size.width * .045,
                right: size.width * .04),
            child: Column(
              children: [
                CardTwoLogoutItem(onTap: onTap, size: size),
                SizedBox(height: size.width * .001),
                CardTwoDeleteItem(size: size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
