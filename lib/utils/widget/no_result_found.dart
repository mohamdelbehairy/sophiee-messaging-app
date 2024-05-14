import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNoResultFound extends StatelessWidget {
  const CustomNoResultFound(
      {super.key,
      required this.textOne,
      required this.textTwo,
      this.widget,
      this.mainAxisAlignment,
      this.height,
      this.sizedBoxHeightOne,
      this.textOneFontSize,
      this.textTwoFontSize,
      this.sizedBoxHeightTwo});
  final String textOne;
  final String textTwo;
  final Widget? widget;
  final MainAxisAlignment? mainAxisAlignment;
  final double? height;
  final double? sizedBoxHeightOne;
  final double? sizedBoxHeightTwo;
  final double? textOneFontSize;
  final double? textTwoFontSize;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final isDark = context.read<LoginCubit>().isDark;

    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        Container(
            height: height ?? size.height * .25,
            width: size.width * .8,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(emptyImageUrl)))),
        SizedBox(height: sizedBoxHeightOne ?? size.height * .02),
        Text(textOne,
            style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: textOneFontSize ?? size.height * .03)),
        SizedBox(height: sizedBoxHeightTwo ?? size.height * .01),
        Text(textTwo,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: isDark ? Colors.white60 : Colors.grey,
                fontSize: textTwoFontSize ?? size.width * .032)),
        if (widget != null) widget!
      ],
    );
  }
}
