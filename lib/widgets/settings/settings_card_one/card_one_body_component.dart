import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/widgets/settings/settings_card_one/card_one_items_one.dart';
import 'package:sophiee/widgets/settings/settings_card_one/card_one_items_two.dart';

import '../../../models/users_model.dart';

class CardOneBodyComponenet extends StatelessWidget {
  const CardOneBodyComponenet(
      {super.key,
      required this.size,
      required this.onPressed,
      required this.userData});

  final Size size;
  final Function(bool) onPressed;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.read<LoginCubit>().isDark
          ? cardDarkModeBackground
          : Colors.white,
      elevation: context.read<LoginCubit>().isDark ? 1 : 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, top: 10),
        child: Column(
          children: [
            CardOneItemsOne(
                size: size, onPressed: onPressed, userData: userData),
            const SizedBox(height: 12),
            CardOneItemsTwo(size: size)
          ],
        ),
      ),
    );
  }
}
