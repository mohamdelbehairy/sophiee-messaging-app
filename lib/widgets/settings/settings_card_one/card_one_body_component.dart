import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:sophiee/widgets/settings/settings_card_one/card_one_items_one.dart';
import 'package:sophiee/widgets/settings/settings_card_one/card_one_items_two.dart';

class CardOneBodyComponenet extends StatelessWidget {
  const CardOneBodyComponenet(
      {super.key,
      required this.size,
      required this.onPressed,
      required this.onChanged,
      required this.value});

  final Size size;
  final Function() onPressed;
  final Function(bool) onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.read<LoginCubit>().isDark ? kDarkModeColor : Colors.white,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.only(
            left: size.width * .045,
            top: size.width * .04,
            bottom: size.width * .04),
        child: Column(
          children: [
            CardOneItemsOne(
                value: value,
                size: size,
                onChanged: onChanged,
                onPressed: onPressed),
            SizedBox(height: size.width * .028),
            CardOneItemsTwo(size: size)
          ],
        ),
      ),
    );
  }
}

