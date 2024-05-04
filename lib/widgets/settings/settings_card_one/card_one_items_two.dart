import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/widgets/settings/custom_items_two.dart';

class CardOneItemsTwo extends StatelessWidget {
  const CardOneItemsTwo({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomItemsTwo(
          size: size,
          textColor:
              context.read<LoginCubit>().isDark ? Colors.white : Colors.black,
          icon2: FontAwesomeIcons.chevronRight,
          text: 'Chat Customize',
          iconSize: size.width * .034,
          icon: FontAwesomeIcons.solidComments,
          color: Colors.indigoAccent.shade400),
      SizedBox(height: size.width * .028),
      CustomItemsTwo(
          size: size,
          icon2: FontAwesomeIcons.chevronRight,
          text: 'Notification',
          iconSize: size.width * .048,
          icon: Icons.notifications_active,
          color: Colors.pink.shade400,
          textColor:
              context.read<LoginCubit>().isDark ? Colors.white : Colors.black),
      SizedBox(height: size.width * .028),
      CustomItemsTwo(
          size: size,
          textColor:
              context.read<LoginCubit>().isDark ? Colors.white : Colors.black,
          icon2: FontAwesomeIcons.chevronRight,
          text: 'Privacy',
          iconSize: size.width * .04,
          icon: FontAwesomeIcons.shield,
          color: const Color(0xffB338E0)),
    ]);
  }
}
