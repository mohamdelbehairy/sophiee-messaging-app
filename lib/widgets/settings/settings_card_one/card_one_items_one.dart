import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/widgets/settings/settings_card_one/card_one_custom_items_one.dart';

class CardOneItemsOne extends StatelessWidget {
  const CardOneItemsOne(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.onPressed,
      required this.size});
  final bool value;
  final Function(bool) onChanged;
  final Function() onPressed;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: size.width * .04),
      child: Column(
        children: [
          CardOneCustomItemsOne(
              value: value,
              onChanged: onChanged,
              size: size,
              onPressed: onPressed,
              iconChange: Icons.brightness_4_outlined,
              text: 'Dark Mode',
              icon: FontAwesomeIcons.solidMoon,
              color: context.read<LoginCubit>().isDark
                  ? Colors.grey
                  : Colors.black54),
          SizedBox(height: size.width * .028),
          CardOneCustomItemsOne(
              onChanged: (value) {},
              value: true,
              size: size,
              onPressed: () {},
              iconChange: Icons.lock,
              text: 'Profile Lock',
              icon: Icons.person,
              color: kPrimaryColor),
        ],
      ),
    );
  }
}
