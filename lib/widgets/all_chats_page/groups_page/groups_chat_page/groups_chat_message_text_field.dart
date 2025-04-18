import 'package:sophiee/constants.dart';
import 'package:sophiee/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sophiee/models/users_model.dart';

class GroupChatMessageTextField extends StatelessWidget {
  const GroupChatMessageTextField(
      {super.key,
      required this.controller,
      required this.onChanged,
      required this.onPressed,
      required this.focusNode,
      required this.userDataModel});
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function() onPressed;
  final FocusNode focusNode;
  final UserModel userDataModel;

  @override
  Widget build(BuildContext context) {
    var isDark = context.read<LoginCubit>().isDark;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .8,
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        cursorColor: isDark ? Colors.white : const Color(0xff2b2c33),
        style: TextStyle(
            color: isDark ? Colors.white : Colors.black, fontSize: 14),
        maxLines: null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: size.width * .04),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.width * .08),
            borderSide: BorderSide(
              color: userDataModel.chatbackgroundImage != null
                  ? kPrimaryColor
                  : const Color(0xff2b2c33).withValues(alpha: .1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.width * .08),
            borderSide: BorderSide(
                color: userDataModel.chatbackgroundImage != null
                    ? kPrimaryColor
                    : const Color(0xff2b2c33).withValues(alpha: .1)),
          ),
          filled: true,
          fillColor: isDark
              ? messageFriendColorDarkMode
              : const Color(0xff2b2c33).withValues(alpha:  .1),
          hintText: 'Type your message',
          hintStyle: TextStyle(color: isDark ? Colors.white70 : Colors.grey),
          prefixIcon: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: onPressed,
            icon: Padding(
              padding: EdgeInsets.only(
                  right: size.width * .04, left: size.width * .02),
              child: Icon(
                FontAwesomeIcons.paperclip,
                color: kPrimaryColor,
                size: size.width * .05,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
