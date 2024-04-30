import 'package:sophiee/constants.dart';
import 'package:flutter/material.dart';

class GroupsChatEditTextField extends StatelessWidget {
  const GroupsChatEditTextField({super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * .03),
      child: TextField(
        controller: controller,
        cursorColor: kPrimaryColor,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: kPrimaryColor, width: size.width * .008)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: kPrimaryColor, width: size.width * .008))),
      ),
    );
  }
}
