import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/widgets/settings/custom_items_two.dart';

class CardTwoLogoutItem extends StatelessWidget {
  const CardTwoLogoutItem({super.key, required this.onTap, required this.size});

  final Function() onTap;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomItemsTwo(
        onTap: onTap,
        size: size,
        textColor:
            context.read<LoginCubit>().isDark ? Colors.white : Colors.black,
        enableFeedback: false,
        color: Colors.orange,
        icon: Icons.lock,
        iconSize: size.width * .044,
        text: 'Logout');
  }
}
