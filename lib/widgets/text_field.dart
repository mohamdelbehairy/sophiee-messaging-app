import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.obscureText = false,
      this.textInputType,
      this.onChanged,
      required this.validator,
      this.controller,
      this.isLoading});
  final String hintText;
  final bool obscureText;
  final TextInputType? textInputType;
  final Function(String?)? onChanged;
  final String? Function(String?) validator;
  final TextEditingController? controller;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: TextFormField(
        enabled: isLoading,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: textInputType,
        cursorColor: isDark ? Colors.white : const Color(0xff2b2c33),
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            filled: true,
            fillColor: isDark
                ? const Color(0xff424548)
                : const Color(0xff2b2c33).withOpacity(.1),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: isDark ? Colors.white : Colors.black87)),
        style: TextStyle(color: isDark ? Colors.white : Colors.black87),
      ),
    );
  }
}
