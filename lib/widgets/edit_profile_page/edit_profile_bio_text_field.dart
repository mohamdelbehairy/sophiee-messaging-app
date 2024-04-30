import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileBioTextField extends StatelessWidget {
  const EditProfileBioTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    final size = MediaQuery.of(context).size;
    return TextField(
      controller: controller,
      maxLines: 3,
      maxLength: 111,
      cursorColor: Colors.grey,
      style: TextStyle(color: isDark ? Colors.white70 : Colors.black),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * .02),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.width * .02),
            borderSide: const BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * .02),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
