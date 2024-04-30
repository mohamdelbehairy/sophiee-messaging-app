import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileTextField extends StatelessWidget {
  const EditProfileTextField(
      {super.key, required this.hintText, required this.controller});
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    final size = MediaQuery.of(context).size;
    return TextField(
      controller: controller,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.grey : Colors.black,
          fontSize: size.height * .02),
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(.6),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(.6),
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            color: isDark ? Colors.grey : Colors.black,
            fontSize: size.height * .018),
      ),
    );
  }
}
