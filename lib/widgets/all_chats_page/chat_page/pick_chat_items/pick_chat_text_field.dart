import 'package:flutter/material.dart';

class PickChatTextField extends StatelessWidget {
  const PickChatTextField({super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Container(
      color: const Color(0xff000101),
      padding: EdgeInsets.only(top: size.height *.015),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.height *.025),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xff1e2c32),
              contentPadding: EdgeInsets.symmetric(horizontal: size.height *.025),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(size.height *.032),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(size.height *.032),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.normal)),
        ),
      ),
    );
  }
}
