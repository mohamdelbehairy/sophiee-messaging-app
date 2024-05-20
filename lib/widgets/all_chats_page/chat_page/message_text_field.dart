import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/models/users_model.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField(
      {super.key,
      required this.onPressed,
      required this.controller,
      required this.onChanged,
      required this.focusNode,
      required this.userData});
  final Function() onPressed;
  final TextEditingController controller;
  final Function(String) onChanged;
  final FocusNode focusNode;
  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<LoginCubit>().isDark;
    return TextField(
      focusNode: focusNode,
      controller: controller,
      onChanged: onChanged,
      cursorColor: isDark ? Colors.white : const Color(0xff2b2c33),
      style:
          TextStyle(color: isDark ? Colors.white : Colors.black, fontSize: 14),
      maxLines: null,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
                color: userData.chatbackgroundImage != null
                    ? kPrimaryColor
                    : const Color(0xff2b2c33).withOpacity(.1))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
                color: userData.chatbackgroundImage != null
                    ? kPrimaryColor
                    : const Color(0xff2b2c33).withOpacity(.1))),
        filled: true,
        fillColor: isDark
            ? messageFriendColorDarkMode
            : const Color(0xff2b2c33).withOpacity(.1),
        hintText: 'Type your message',
        hintStyle: TextStyle(color: isDark ? Colors.white70 : Colors.grey),
        prefixIcon: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: onPressed,
          icon: const Padding(
            padding: EdgeInsets.only(right: 16, left: 8),
            child: Icon(FontAwesomeIcons.paperclip,
                color: kPrimaryColor, size: 20),
          ),
        ),
      ),
    );
  }
}
