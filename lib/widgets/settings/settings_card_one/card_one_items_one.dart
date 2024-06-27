import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/cubit/update_user_data/update_user_cubit_cubit.dart';
import 'package:sophiee/models/users_model.dart';
import 'package:sophiee/widgets/settings/settings_card_one/card_one_custom_items_one.dart';

class CardOneItemsOne extends StatelessWidget {
  const CardOneItemsOne(
      {super.key,
      required this.onPressed,
      required this.size,
      required this.userData});

  final Function(bool) onPressed;
  final Size size;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    var updateField = context.read<UpdateUserDataCubit>();
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          CardOneCustomItemsOne(
              value: context.read<LoginCubit>().isDark,
              size: size,
              onPressed: onPressed,
              iconChange: Icons.brightness_4_outlined,
              text: 'Dark Mode',
              icon: FontAwesomeIcons.solidMoon,
              color: context.read<LoginCubit>().isDark
                  ? Colors.grey
                  : Colors.black54),
          const SizedBox(height: 12),
          CardOneCustomItemsOne(
              size: size,
              value: userData.isProfileLock,
              onPressed: (value) async {
                await updateField.updateUserField(
                    fieldName: 'isProfileLock', fieldValue: value);
              },
              iconChange: Icons.lock,
              text: 'Profile Lock',
              icon: Icons.person,
              color: kPrimaryColor),
        ],
      ),
    );
  }
}
