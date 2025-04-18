import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophiee/constants.dart';

import '../../cubit/auth/login/login_cubit.dart';

class AddUserTextField extends StatelessWidget {
  const AddUserTextField(
      {super.key,
      required this.size,
      required this.hintText,
      this.suffixIcon,
      this.onTap,
      required this.controller,
      this.iconColor,
      this.textInputType,
      this.validator,
      this.enabled,
      this.bottom});

  final Size size;
  final String hintText;
  final Widget? suffixIcon;
  final Function()? onTap;
  final TextEditingController controller;
  final Color? iconColor;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final bool? enabled;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    return Padding(
      padding: EdgeInsets.only(bottom: bottom ?? size.width * .045),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(size.width * .02),
          child: GestureDetector(
            onTap: onTap,
            child: TextFormField(
              enabled: enabled,
              validator: validator,
              controller: controller,
              keyboardType: textInputType,
              cursorColor: isDark ? Colors.white : Colors.black,
              style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w100,
                  fontSize: size.width * .035),
              decoration: InputDecoration(
                  suffixIcon: suffixIcon,
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: isDark ? Colors.white70 : const Color(0xffc3c5c5),
                      fontWeight: FontWeight.w100,
                      fontSize: size.width * .035),
                  filled: true,
                  fillColor: isDark
                      ? messageFriendColorDarkMode
                      : const Color(0xff2b2c33).withValues(alpha: .035)),
            ),
          )),
    );
  }
}
